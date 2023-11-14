using Evsell.Business.Common.Response;
using Evsell.Business.Redis.Bo.Basket;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.Redis.Business.Interface
{
    public interface IRedisBasketBusiness
    {
        public ResponseDto Save(RedisBasketCriteriaBo redisBasketCriteriaBo);
        public ResponseDto<List<RedisBasketBo>> Get(string key);
        public ResponseDto Delete(RedisDeleteBasketBo redisDeleteBasketBo);
    }
}
