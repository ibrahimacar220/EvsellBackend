using Evsell.Business.Common.Response;
using Evsell.Business.SqlServer.Bo.ProductCategory;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class ProdutCategoryBusiness : IProductCategoryBusiness
    {
        readonly EvsellDbContext dbContext;

        public ProdutCategoryBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto<List<ProductCategoryBo>> GetList()
        {
            try
            {

                List<ProductCategory> productCategorys = (from x in dbContext.ProductCategories
                                                         select x).ToList();

                List<ProductCategoryBo> productCategoryBos = new List<ProductCategoryBo>();

                foreach (var item in productCategorys)
                {
                    ProductCategoryBo productCategoryBo = new ProductCategoryBo()
                    {
                         Id = item.Id,
                         Name = item.Name,
                         ParentId = item.ParentId,
                    };
                    productCategoryBos.Add(productCategoryBo);
                }
                return new ResponseDto<List<ProductCategoryBo>>().Success(productCategoryBos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<ProductCategoryBo>>().FailedWithException(ex);
            }
        }

        public ResponseDto<List<ProductCateBo>> GetListChildren()
        {

            List<ProductCategoryBo> rawList = GetList().Dto;

            ProductCateBo resultItem = null;
            List<ProductCateBo> result = new List<ProductCateBo>();
            try
            {
                foreach (ProductCategoryBo item in rawList.Where(p => p.ParentId == null))
                {
                    resultItem = new ProductCateBo()
                    {
                        Id = item.Id,
                        Name = item.Name,
                        SubList = GetListChildItem(item.Id, rawList),
                    };

                    result.Add(resultItem);
                }
                return new ResponseDto<List<ProductCateBo>>().Success(result);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<ProductCateBo>>().FailedWithException(ex);
            }
        }

        List<ProductCateBo> GetListChildItem(int id, List<ProductCategoryBo> rawList)
        {
            try
            {
                List<ProductCateBo> list = (from x in rawList
                                          where x.ParentId == id
                                          select new ProductCateBo()
                                          {
                                              Id = x.Id,
                                              Name = x.Name,
                                              SubList = GetListChildItem(x.Id, rawList),
                                          }).ToList();
                return list;
            }
            catch (Exception ex)
            {

            }

            return null;
        }

        public void Dispose()
        {
            if (dbContext == null) return;

            dbContext.Dispose();
        }
    }
}
