using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.Redis.Bo.Basket
{
    public class RedisDeleteBasketBo
    {
        public int UserId { get; set; }
        public int Qty { get; set; }
        public int ProductId { get; set; }
    }
}
