using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.ProductComment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface IProductCommentBusiness:IDisposable
    {
        public ResponseDto Save(ProductCommentSaveCriteriaBo productCommentSaveCriteriaBo);
        public ResponseDto Delete(ProductCommentDelCriteriaBo productCommentDelCriteriaBo);
        public ResponseDto<ProductCommentBo> Get(ProductCommentGetCriteriaBo productCommentGetCriteriaBo);
        public ResponseDto<List<ProductCommentBo>> GetList(ProductCommentGetListCriteriaBo productCommentGetListCriteriaBo);
    }
}
