using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Dtos;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class BasketBusiness : IBasketBusiness
    {
        readonly EvsellDbContext dbContext;
        public BasketBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto Save(BasketCriteriaBo basketCriteriaBo)
        {
            int buyerId;
            List<InvoiceProductDto> ProductProperties = basketCriteriaBo.InvoiceProductDtos;
            Product product = null;
            List<Basket> basketProductList = new List<Basket>();
            Basket basket = null;
            Basket OldBasket = null;

            foreach (var item in ProductProperties)
            {
                buyerId = basketCriteriaBo.BuyerId;

                User user = dbContext.Users.Find(buyerId);

                if (user == null)
                {
                    return new ResponseDto().Failed("User Not Found");
                }

                product = GetProduct(item.productId).Dto;

                if (product == null)
                {
                    return new ResponseDto().Failed("Product Not Found");
                }

                var existingBasket = basketProductList.FirstOrDefault(p => p.ProductId == product.Id);

                #region Logging               
                BasketLog basketLog = new BasketLog()
                {
                    IsInput = true,
                    CreateDate = DateTime.Now,
                    CreateUserId = buyerId,
                    ProductId = item.productId,
                    IsDeleted = false,
                    Qty = item.qty,
                };
                #endregion

                dbContext.BasketLogs.Add(basketLog);
                dbContext.SaveChanges();

                #region Stock Control         
                if (product.Stock < item.qty)
                {
                    return new ResponseDto().Failed("Temporarily out of stock.");
                }
                #endregion

                if (existingBasket == null)
                {
                    basket = new Basket()
                    {
                        UserId = buyerId,

                        ProductId = item.productId,

                        Qty = item.qty,

                        CreateDate = DateTime.Now,

                        CreateUserId = buyerId,

                    };
                    basketProductList.Add(basket);
                }
                else
                {
                    basket = new Basket()
                    {
                        UserId = buyerId,

                        ProductId = product.Id,

                        Qty = item.qty += existingBasket.Qty,

                        CreateDate = DateTime.Now,

                        CreateUserId = buyerId,

                    };

                    basketProductList.Remove(existingBasket);

                    basketProductList.Add(basket);

                }

            }

            #region English: Cheking db for the have same product in user basket. If user have same product, we are deleting old product and saving new product with old product quantity :). 
            //Turkish: databasede aynı üründen varmı diye kontrol ediyoruz eğer var ise eski ürünü silip eski ürünün adedini yeni ürünün adedi ile toplayıp kaydediyoruz.


            foreach (var item2 in basketProductList)
            {
                buyerId = basketCriteriaBo.BuyerId;

                OldBasket = (from x in dbContext.Baskets
                             where x.ProductId == item2.ProductId && x.UserId == buyerId
                             select x).FirstOrDefault();

                if (OldBasket != null)
                {
                    if (item2.ProductId == OldBasket.ProductId)
                    {
                        dbContext.Remove(OldBasket);
                        item2.Qty += OldBasket.Qty;
                    }
                }
            }

            #endregion

            dbContext.Baskets.AddRange(basketProductList);
            dbContext.SaveChanges();

            return new ResponseDto().Success(basketCriteriaBo.BuyerId);
        }

        public ResponseDto<List<BasketBo>> GetBaskets(GetBasketBo getBasketBo)
        {
            try
            {

                List<BasketBo> basketDtos = (from B in dbContext.Baskets
                                             join P in dbContext.Products
                                             on B.ProductId equals P.Id
                                             where B.UserId == getBasketBo.BuyerId
                                             select new BasketBo
                                             {
                                                 ProductId = P.Id,
                                                 ProductName = P.Name,
                                                 Image = P.Image,
                                                 Qty = B.Qty,
                                                 Price = P.Price
                                             }).ToList();

                return new ResponseDto<List<BasketBo>>().Success(basketDtos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<BasketBo>>().FailedWithException(ex);
            }
        }

        public ResponseDto<Product> GetProduct(int id)
        {
            try
            {
                Product product = dbContext.Products.Find(id);

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

        public ResponseDto Delete(DeleteBasketBo deleteBasketBo)
        {
            try
            {

                List<Basket> baskets = dbContext.Baskets.Where(b => b.UserId == deleteBasketBo.UserId).ToList();

                Basket basket = baskets.FirstOrDefault(p => p.ProductId == deleteBasketBo.ProductId);

                if (basket == null)
                {
                    return new ResponseDto().Failed("Product Not Found");
                }

                BasketLog basketLog = new BasketLog()
                {

                    IsDeleted = false,
                    IsInput = false,
                    ProductId = deleteBasketBo.ProductId,
                    Qty = deleteBasketBo.Qty,
                    CreateDate = DateTime.Now,
                    CreateUserId = deleteBasketBo.UserId

                };

                basket.Qty -= deleteBasketBo.Qty;

                if (basket.Qty == 0)
                {
                    dbContext.Baskets.Remove(basket);
                    dbContext.SaveChanges();

                    basketLog.IsDeleted = true;
                }

                dbContext.BasketLogs.Add(basketLog);

                dbContext.SaveChanges();

                return new ResponseDto().Success();

            }
            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }

        }
        public void Dispose()
        {
            if (dbContext == null) return;

            dbContext.Dispose();
        }
    }
}
