using Evsell.Busssiness.SqlServer.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Bo.Basket
{
    public class BasketCriteriaBo
    {
        public int BuyerId { get; set; }
        public List<InvoiceProductDto> InvoiceProductDtos { get; set; }
    }
}
