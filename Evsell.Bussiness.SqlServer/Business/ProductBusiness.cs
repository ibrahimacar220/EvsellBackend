using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Product;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class ProductBusiness : IProductBusiness
    {
        readonly EvsellDbContext dbContext;

        public ProductBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto Save(ProductBo productBo)
        {
            try
            {
                Product product = null;

                if (productBo.Id <= 0)
                {//insert
                    product = new Product()
                    {
                        CompanyId = productBo.CompanyId,
                        Name = productBo.Name,
                        Price = productBo.Price,
                        Image = productBo.Image,
                        Description = productBo.Description,
                        CategoryId = productBo.CategoryId,
                        Stock = productBo.Stock,
                        Tax = 18,
                        IsActive = true,
                        CreateDate = DateTime.Now,
                        CreateUserId = 1
                    };
                    dbContext.Products.Add(product);
                }

                else
                {//update
                    product = GetProduct(productBo.Id).Dto;
                    if (product == null)
                    {
                        return null;
                    }
                    product.Name = productBo.Name;
                    product.Price = productBo.Price;
                    product.Image = productBo.Image;
                    product.Description = productBo.Description;
                }

                dbContext.SaveChanges();
                return new ResponseDto().Success(productBo.Id);
            }

            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);

            }
        }

        public ResponseDto Delete(ProductDelCriteriaBo productDelCriteriaBo)
        {
            ResponseDto<Product> product = GetProduct(productDelCriteriaBo.Id);
            if (product == null)
            {
                return new ResponseDto().Failed("Invalid Product");
            }

            dbContext.Products.Remove(product.Dto);
            dbContext.SaveChanges();
            return new ResponseDto().Success(productDelCriteriaBo.Id);
        }

        public ResponseDto ProductStockChange(ProductStockChangeCriteriaBo productStockChangeCriteriaBo)
        {
            try
            {
                Product product = GetProduct(productStockChangeCriteriaBo.ProductId).Dto;

                int Change = productStockChangeCriteriaBo.Change;
                bool isInput = productStockChangeCriteriaBo.IsInput;
                if (product == null)
                {
                    return new ResponseDto().Failed("Product Not Found.");
                }

                if (productStockChangeCriteriaBo.Change <= 0)
                {
                    return new ResponseDto().Failed("Stock Change Amount Must be Bigger Than 0");
                }

                ProductStockLog productStockLog = new ProductStockLog()
                {
                    ProductId = product.Id,
                    Qty = Change,
                    IsInput = isInput,

                    CreateUserId = product.CompanyId,
                    CreateDate = DateTime.Now,
                };
                //                       true false
                product.Stock = (isInput ? 1 : -1) * Change + product.Stock;
                //if (isInput == true)
                //{
                //    product.Stock += change;
                //}
                //else
                //{
                //    product.Stock -= change;
                //}

                dbContext.ProductStockLogs.Add(productStockLog);
                dbContext.SaveChanges();

                return new ResponseDto().Success(product.Id);
            }
            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }
        }

        public ResponseDto StockControl(ProductGetBo productGetBo)
        {
            try
            {
                Product product = GetProduct(productGetBo.Id).Dto;

                if (product == null)
                {
                    return new ResponseDto().Failed("Product Not Found");
                }

                return new ResponseDto().Success(product.Stock);
            }
            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }
        }

        public ResponseDto<ProductBo> Get(ProductGetBo productGetBo)
        {
            try
            {
                Product product = dbContext.Products.Find(productGetBo.Id);
                if (product == null)
                {
                    return new ResponseDto<ProductBo>().Failed("Product Not Found");
                }
                ProductBo productBo = new ProductBo()
                {
                    Id = product.Id,
                    Name = product.Name,
                    CategoryId = product.CategoryId,
                    CompanyId = product.CompanyId,
                    Description = product.Description,
                    IsActive = product.IsActive,
                    Image = product.Image,
                    Price = product.Price,
                    Stock = product.Stock
                };
                return new ResponseDto<ProductBo>().Success(productBo);
            }
            catch (Exception ex)
            {
                return new ResponseDto<ProductBo>().FailedWithException(ex);
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

        public ResponseDto<List<ProductBo>> GetList(ProductGetListCriteriaBo productGetListCriteriaBo)
        {
            try
            {
                List<Product> products = (from x in dbContext.Products
                                          where productGetListCriteriaBo.IsActive == null || x.IsActive == productGetListCriteriaBo.IsActive.Value
                                          select x).ToList();

                List<ProductBo> productBos = new List<ProductBo>();

                foreach (Product product in products)
                {
                    ProductBo productBo = new ProductBo()
                    {
                        Id = product.Id,
                        CategoryId = product.CategoryId,
                        CompanyId = product.CompanyId,
                        Description = product.Description,
                        Image = product.Image,
                        Name = product.Name,
                        Price = product.Price,
                        Stock = product.Stock,
                        IsActive = product.IsActive
                    };
                    productBos.Add(productBo);
                }
                return new ResponseDto<List<ProductBo>>().Success(productBos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<ProductBo>>().FailedWithException(ex);
            }//wrap
        }

        public ResponseDto<List<ProductBo>> GetListByCategoryId(ProductGetListByBo productGetListByBo)
        {
            try
            {
                ProductCategory productCategory = dbContext.ProductCategories.Find(productGetListByBo.Id);

                List<ProductBo> productBos = new List<ProductBo>();

                if (productCategory == null)
                {
                    return new ResponseDto<List<ProductBo>>().Failed("Category Not Found.");
                }

                List<Product> products = dbContext.Products.Where(x => x.CategoryId == productGetListByBo.Id).ToList();

                foreach (var product in products)
                {
                    ProductBo productBo = new ProductBo() 
                    {
                        Id = product.Id,
                        CategoryId = product.CategoryId,
                        Name = product.Name,
                        Price = product.Price,
                        Stock = product.Stock,
                        CompanyId = product.CompanyId,
                        Description = product.Description,
                        Image = product.Image,
                        IsActive = product.IsActive
                    };
                    productBos.Add(productBo);
                }

                return new ResponseDto<List<ProductBo>>().Success(productBos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<ProductBo>>().FailedWithException(ex);
            }//wrap
        }

        public ResponseDto<List<ProductBo>> GetListByCompanyId(ProductGetListByBo productGetListByBo)
        {
            try
            {
                Company company = dbContext.Companies.Find(productGetListByBo.Id);

                List<ProductBo> productBos = new List<ProductBo>();

                if (company == null)
                {
                    return new ResponseDto<List<ProductBo>>().Failed("Company Not Found.");
                }

                List<Product> products = dbContext.Products.Where(p => p.CompanyId == productGetListByBo.Id).ToList();

                foreach (var product in products)
                {
                    ProductBo productBo = new ProductBo()
                    {
                        Id = product.Id,
                        CategoryId = product.CategoryId,
                        Name = product.Name,
                        Price = product.Price,
                        Stock = product.Stock,
                        CompanyId = product.CompanyId,
                        Description = product.Description,
                        Image = product.Image,
                        IsActive = product.IsActive
                    };
                    productBos.Add(productBo);
                }

                return new ResponseDto<List<ProductBo>>().Success(productBos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<ProductBo>>().FailedWithException(ex);
            }//wrap
        }

        public void Dispose()
        {
            if (dbContext == null) return;

            dbContext.Dispose();
        }
    }

}
