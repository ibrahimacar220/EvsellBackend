using Evsell.Busssiness.SqlServer.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.Redis.Bo.Basket
{
    public class RedisBasketCriteriaBo
    {
        public int BuyerId { get; set; }
        public List<InvoiceProductDto> InvoiceProductDtos { get; set; }
    }
}
