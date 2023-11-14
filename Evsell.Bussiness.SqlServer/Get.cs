using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer
{
    public class Get
    {

        readonly EvsellDbContext dbContext;
        public Get()
        {
            dbContext = new EvsellDbContext();
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

        public ResponseDto<User> GetUser(int id)
        {
            try
            {
                User user = dbContext.Users.Find(id);

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

        public ResponseDto<Company> GetCompany(int id)
        {
            try
            {
                Company company = dbContext.Companies.Find(id);

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

        public ResponseDto<HtmlEmailPage> GetHtmlPage(int id)
        {
            try
            {
                HtmlEmailPage htmlEmailPage = dbContext.HtmlEmailPages.Find(id);
                return new ResponseDto<HtmlEmailPage>().Success(htmlEmailPage);
            }
            catch (Exception ex)
            {
                return new ResponseDto<HtmlEmailPage>().FailedWithException(ex);
            }
        }

        public ResponseDto<Basket> GetBasket(int id)
        {
            try
            {
                Basket basket = dbContext.Baskets.Find(id);
                return new ResponseDto<Basket>().Success(basket);
            }
            catch (Exception ex)
            {
                return new ResponseDto<Basket>().FailedWithException(ex);
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
    }
}
