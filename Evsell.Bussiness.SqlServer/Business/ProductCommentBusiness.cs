using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.ProductComment;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class ProductCommentBusiness:IProductCommentBusiness
    {
        readonly EvsellDbContext dbContext;
        public ProductCommentBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto Save(ProductCommentSaveCriteriaBo productCommentSaveCriteriaBo)
        {
            int id = productCommentSaveCriteriaBo.Id;
            int userId = productCommentSaveCriteriaBo.UserId;
            int productId = productCommentSaveCriteriaBo.ProductId;
            bool isActive = productCommentSaveCriteriaBo.IsActive;
            string header = productCommentSaveCriteriaBo.Header;
            string comments = productCommentSaveCriteriaBo.Comments;
            int productRate = productCommentSaveCriteriaBo.ProductRate;

            if (productRate > 5 || productRate <= 0)
            {
                return new ResponseDto().Failed("Enter a Rate Between 5 And 0");
            }

            try
            {
                ProductComment comment = null;

                if (id <= 0)
                {//insert 
                 // 1 => productRate <= 5 and cant null

                    comment = new ProductComment()
                    {
                        Id = id,
                        UserId = userId,
                        ProductId = productId,
                        Comments = comments,
                        Header = header,
                        IsActive = true,
                        ProductRate = productRate
                    };

                    dbContext.ProductComments.Add(comment);

                }
                else
                {//update

                    comment = GetProductComment(id).Dto;

                    if (comment == null)
                    {
                        return null;
                    }

                    comment.Comments = comments;
                    comment.Header = header;

                }

                dbContext.SaveChanges();

                return new ResponseDto().Success(comment.Id);
            }

            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }
        }

        public ResponseDto Delete(ProductCommentDelCriteriaBo productCommentDelCriteriaBo)
        {
            ProductComment productComment = GetProductComment(productCommentDelCriteriaBo.Id).Dto;

            if (productComment == null)
            {
                return new ResponseDto().Failed("ProductComment Not Found");
            }

            dbContext.ProductComments.Remove(productComment);
            dbContext.SaveChanges();

            return new ResponseDto().Success(productCommentDelCriteriaBo.Id);
        }

        public ResponseDto<ProductCommentBo> Get(ProductCommentGetCriteriaBo productCommentGetCriteriaBo)
        {
            try
            {
                ProductComment productComment = dbContext.ProductComments.Find(productCommentGetCriteriaBo.Id);

                if (productComment == null)
                {
                    return new ResponseDto<ProductCommentBo>().Failed("ProductComment Not Found");
                }
                ProductCommentBo productCommentBo = new ProductCommentBo();

                productCommentBo.Id = productComment.Id;
                productCommentBo.ProductId = productComment.ProductId;
                productCommentBo.Comments = productComment.Comments;
                productCommentBo.ProductRate = productCommentBo.ProductRate;
                productCommentBo.Header = productComment.Header;
                productCommentBo.UserId = productComment.UserId;
                productCommentBo.IsActive = productComment.IsActive;

                return new ResponseDto<ProductCommentBo>().Success(productCommentBo);
            }
            catch (Exception ex)
            {
                return new ResponseDto<ProductCommentBo>().FailedWithException(ex);
            }
        }

        public ResponseDto<ProductComment> GetProductComment(int id)
        {
            try
            {
                ProductComment productComment = dbContext.ProductComments.Find(id);
                return new ResponseDto<ProductComment>().Success(productComment);
            }
            catch (Exception ex)
            {
                return new ResponseDto<ProductComment>().FailedWithException(ex);
            }
        }

        public ResponseDto<List<ProductCommentBo>> GetList(ProductCommentGetListCriteriaBo productCommentGetListCriteriaBo)
        {
            try
            {
                List<ProductComment> productComments = (from x in dbContext.ProductComments
                                                        where productCommentGetListCriteriaBo.IsActive == null || x.IsActive == productCommentGetListCriteriaBo.IsActive.Value
                                                        select x).ToList();

                List<ProductCommentBo> productCommentBos = new List<ProductCommentBo>();
                foreach (var productComment in productComments)
                {
                    ProductCommentBo productCommentBo = new ProductCommentBo()
                    {
                        Id = productComment.Id,
                        IsActive = productComment.IsActive,
                        Header = productComment.Header,
                        Comments = productComment.Comments,
                        UserId = productComment.UserId,
                        ProductId = productComment.ProductId,
                        ProductRate = productComment.ProductRate 
                    };
                    productCommentBos.Add(productCommentBo);
                }

                return new ResponseDto<List<ProductCommentBo>>().Success(productCommentBos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<ProductCommentBo>>().FailedWithException(ex);
            }
        }

        public void Dispose()
        {
            if (dbContext == null) return;
            {
                dbContext.Dispose();
            }
        }
    }
}
