using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface IBasketBusiness:IDisposable
    {
        public ResponseDto Save(BasketCriteriaBo basketCriteriaBo);
        public ResponseDto<List<BasketBo>> GetBaskets(GetBasketBo getBasketBo);
        public ResponseDto Delete(DeleteBasketBo deleteBasketBo);
    }
}
