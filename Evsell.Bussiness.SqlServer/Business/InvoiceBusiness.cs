using Evsell.Business.Common.Response;
using Evsell.Business.Email.MailBusiness;
using Evsell.Busssiness.SqlServer.Bo.Invoice;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Dtos;
using Evsell.Busssiness.SqlServer.EnumType;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class InvoiceBusiness : IInvoiceBusiness
    {

        readonly EvsellDbContext dbContext;

        public InvoiceBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto Save(InvoiceSaveCriteriaBo invoiceSaveCriteriaBo)
        {
            List<Basket> basket = null;

            InvoiceEmail mailSender = new InvoiceEmail();

            User buyerUser = null;
            Company sellerCompany = null;
            User sellerUser = null;

            List<string> mailProductNameList = new List<string>();
            List<InvoiceProduct> productList = new List<InvoiceProduct>();
            InvoiceProduct invoiceProduct = null;
            InvoiceProductDto properties = null;
            Invoice invoice = null;
            Product product = null;

            int buyerId = invoiceSaveCriteriaBo.BuyerId;

            try
            {
                basket = dbContext.Baskets.Where(basket => basket.UserId == buyerId).ToList();

                decimal invoiceTotal = 0;
                decimal invoiceGrandTotal = 0;
                decimal invoiceVatTotal = 0;

                foreach (var item in basket)
                {

                    product = GetProduct(item.ProductId).Dto;

                    invoice = new Invoice()
                    {

                        BuyerUserId = buyerId,
                        SellerCompanyId = product.CompanyId,
                        Total = 0,
                        VatTotal = 0,
                        GrandTotal = 0,
                        StatusId = 0,
                        IsCancelled = false,
                        TransactionDateTime = DateTime.Now,
                        CreateDate = DateTime.Now,
                        CreateUserId = buyerId,

                    };

                    decimal total = 0;
                    decimal tax = 0;
                    decimal lineTotal = 0;

                    properties = new InvoiceProductDto()
                    {
                        productId = item.ProductId,
                        qty = item.Qty
                    };

                    #region stock and product control                  
                    if (properties.qty == 0)
                    {
                        return new ResponseDto().Failed("quantity cannot be 0 please try again");
                    }

                    if (product == null)
                    {
                        return new ResponseDto().Failed("Invalid Data");
                    }
                    #endregion

                    var existingProduct = productList.FirstOrDefault(p => p.ProductId == product.Id);

                    var totalQty = properties.qty;

                    total = properties.qty * product.Price;
                    tax = total * 18 / 100;
                    lineTotal = tax + total;

                    #region InvoiceProductSave

                    if (existingProduct == null)
                    {
                        invoiceProduct = new InvoiceProduct()
                        {
                            ProductId = product.Id,
                            ProductName = product.Name,
                            ProductPrice = product.Price,
                            ProductVat = product.Tax,
                            Qty = totalQty,
                            Total = total,
                            Tax = tax,
                            LineTotal = lineTotal,

                        };
                        productList.Add(invoiceProduct);
                    }
                    else
                    {
                        invoiceProduct = new InvoiceProduct()
                        {
                            ProductId = product.Id,
                            ProductName = product.Name,
                            ProductPrice = product.Price,
                            ProductVat = product.Tax,
                            Qty = existingProduct.Qty + totalQty,
                            Total = existingProduct.Total + total,
                            Tax = existingProduct.Tax + tax,
                            LineTotal = existingProduct.LineTotal + lineTotal
                        };
                        productList.Remove(existingProduct);
                        productList.Add(invoiceProduct);
                    }

                    #endregion

                    invoiceTotal += total;
                    invoiceGrandTotal += lineTotal;
                    invoiceVatTotal += tax;

                }

                invoice.Total = invoiceTotal;
                invoice.GrandTotal = invoiceGrandTotal;
                invoice.VatTotal = invoiceVatTotal;

                #region StockControl

                if (product.Stock >= invoiceProduct.Qty)
                {
                    product.Stock -= invoiceProduct.Qty;
                }
                else
                {
                    return new ResponseDto().Failed("Temporarily out of stock.");
                }

                #endregion

                dbContext.Invoices.Add(invoice);
                dbContext.SaveChanges();

                productList.ForEach(item =>
                {
                    item.InvoiceId = invoice.Id;
                });

                dbContext.InvoiceProducts.AddRange(productList);
                dbContext.SaveChanges();

                foreach (var item in basket)
                {
                    dbContext.Baskets.Remove(item);
                }

                dbContext.SaveChanges();

                #region Email

                sellerCompany = GetCompany(product.CompanyId).Dto;
                sellerUser = GetUser(sellerCompany.UserId).Dto;
                buyerUser = GetUser(buyerId).Dto;

                productList.ForEach(item =>
                {
                    mailProductNameList.Add(item.ProductName);
                });

                HtmlEmailPage htmlEmailPage = GetHtmlPage((int)EnumHtmlPage.SendPurchaseEmail).Dto;

                mailSender.SendUserPurchaseEmail(buyerUser.UserName, mailProductNameList, invoice.GrandTotal, htmlEmailPage.Page);

                mailSender.SendCompanyPurchaseEmail(sellerUser.UserName, mailProductNameList, invoice.GrandTotal, htmlEmailPage.Page);

                #endregion

                return new ResponseDto().Success(invoice.Id);

            }
            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }
        }

        /// <summary>
        /// TODO:UpdateStatuse company id eklenicek yetki kontrolü yapılıcak
        /// TODO:Invioce de IsCancelled nereye konulucak ? 2 ayrı yerde olcucakmı ?
        /// </summary>
        /// <param name="invoiceId"></param>
        /// <param name="enumInvoiceStatus"></param>
        /// <returns></returns>

        public ResponseDto UpdateStatus(InvoiceUpdateStatusCriteriaBo invoiceUpdateStatusCriteriaBo)
        {
            try
            {
                int enumInvoiceStatus = (int)invoiceUpdateStatusCriteriaBo.EnumInvoiceStatus;

                Invoice invoice = dbContext.Invoices.Find(invoiceUpdateStatusCriteriaBo.Id);

                if (invoice == null)
                {
                    return new ResponseDto().Failed("Invoice Not Found.");
                }

                if (invoice.StatusId >= (int)enumInvoiceStatus)
                {
                    return new ResponseDto().Failed("");
                }

                invoice.StatusId = (int)enumInvoiceStatus;

                InvoiceStatusLog invoiceStatusLog = new InvoiceStatusLog()
                {
                    InvoiceId = invoice.Id,
                    Status = (int)enumInvoiceStatus,
                    CreateDate = DateTime.Now,
                    CreateUserId = invoice.SellerCompanyId,
                };

                dbContext.InvoiceStatusLogs.Add(invoiceStatusLog);
                dbContext.SaveChanges();

                return new ResponseDto().Success(invoice.Id);
            }
            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }
        }

        public ResponseDto Cancel(InvoiceCancelCriteriaBo invoiceCancelCriteriaBo)
        {
            try
            {
                Invoice Invoice = dbContext.Invoices.Find(invoiceCancelCriteriaBo.Id);

                if (Invoice == null)
                {
                    return new ResponseDto().Failed("Invaild Data");
                }

                if (Invoice.IsCancelled == true)
                {
                    return new ResponseDto().Failed("Cancel Failed");
                }

                Invoice.CancelDate = DateTime.Now;
                Invoice.IsCancelled = true;

                dbContext.SaveChanges();

                return new ResponseDto().Success(invoiceCancelCriteriaBo.Id);
            }
            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex, "Failed Cancel");
            }
        }

        public ResponseDto<InvoiceIsCancelledBo> IsCancelled(InvoiceIsCancelledCriteriaBo invoiceIsCancelledCriteriaBo)
        {
            try
            {
                Invoice invoice = dbContext.Invoices.Find(invoiceIsCancelledCriteriaBo.InvoiceId);

                InvoiceIsCancelledBo  invoiceIsCancelledBo = new InvoiceIsCancelledBo();

                invoiceIsCancelledBo.IsCancelled = invoice.IsCancelled;

                if (invoice == null)
                {
                    return new ResponseDto<InvoiceIsCancelledBo>().Failed("Invoice Not Found.");
                }

                return new ResponseDto<InvoiceIsCancelledBo>().Success(invoiceIsCancelledBo);
            }
            catch (Exception ex)
            {
                return new ResponseDto<InvoiceIsCancelledBo>().FailedWithException(ex);
            }
        }

        public ResponseDto<List<InvoiceBo>> GetList(InvoiceGetListCriteriaBo invoiceGetListCriteriaBo)
        {
            try
            {
                List<InvoiceBo> invoiceBos = new List<InvoiceBo>();

                List<Invoice> invoices = dbContext.Invoices.Where(p => p.IsCancelled == invoiceGetListCriteriaBo.IsCancelled).ToList();

                foreach (var item in invoices)
                {
                    InvoiceBo invoiceBo = new InvoiceBo()
                    {
                        Id = item.Id,
                       
                        BuyerUserId = item.BuyerUserId,
                        SellerCompanyId = item.SellerCompanyId,

                        StatusId = item.StatusId,
                                               
                        VatTotal = item.VatTotal,
                        Total = item.Total,
                        GrandTotal = item.GrandTotal,

                        TransactionDateTime = item.TransactionDateTime,
                        IsCancelled = item.IsCancelled,
                        CancelDate = item.CancelDate,
                        CreateDate = item.CreateDate,
                    };
                    invoiceBos.Add(invoiceBo);
                }

                return new ResponseDto<List<InvoiceBo>>().Success(invoiceBos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<InvoiceBo>>().FailedWithException(ex);
            }
        }
        #region OtherGetMethods
        // we are not using in controllers
        
        public ResponseDto<Product> GetProduct(int Id)
        {
            try
            {
                Product product = dbContext.Products.Find(Id);

                if (product == null)
                {
                    return new ResponseDto<Product>().Failed("Product Not Found");
                }

                return new ResponseDto<Product>().Success(product);
            }
            catch (Exception ex)
            {
                return new ResponseDto<Product>().FailedWithException(ex);
            }
        }

        public ResponseDto<User> GetUser(int Id)
        {
            try
            {
                User user = dbContext.Users.Find(Id);

                if (user == null)
                {
                    return new ResponseDto<User>().Failed("User Not Found");
                }

                return new ResponseDto<User>().Success(user);
            }
            catch (Exception ex)
            {
                return new ResponseDto<User>().FailedWithException(ex);
            }

        }

        public ResponseDto<Company> GetCompany(int Id)
        {
            try
            {
                Company company = dbContext.Companies.Find(Id);

                if (company == null)
                {
                    return new ResponseDto<Company>().Failed("Company Not Found");
                }

                return new ResponseDto<Company>().Success(company);
            }
            catch (Exception ex)
            {
                return new ResponseDto<Company>().FailedWithException(ex);
            }
        }

        public ResponseDto<HtmlEmailPage> GetHtmlPage(int Id)
        {
            try
            {
                HtmlEmailPage htmlEmailPage = dbContext.HtmlEmailPages.Find(Id);
                return new ResponseDto<HtmlEmailPage>().Success(htmlEmailPage);
            }
            catch (Exception ex)
            {
                return new ResponseDto<HtmlEmailPage>().FailedWithException(ex);
            }
        }
        public ResponseDto<Basket> GetBasket(int Id)
        {
            try
            {
                Basket basket = dbContext.Baskets.Find(Id);
                return new ResponseDto<Basket>().Success(basket);
            }
            catch (Exception ex)
            {
                return new ResponseDto<Basket>().FailedWithException(ex);
            }
        }
        #endregion
        public void Dispose()
        {
            if (dbContext == null) return;

            dbContext.Dispose();
        }
    }
}

