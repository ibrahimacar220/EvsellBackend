using Evsell.Business.Common.Response;
using Evsell.Business.SqlServer.Bo.ProductCategory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface IProductCategoryBusiness:IDisposable
    {
        public ResponseDto<List<ProductCategoryBo>> GetList();
        public ResponseDto<List<ProductCateBo>> GetListChildren();

    }
}
