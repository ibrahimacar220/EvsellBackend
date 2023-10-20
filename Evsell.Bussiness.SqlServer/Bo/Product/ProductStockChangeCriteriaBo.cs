using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Bo.Product
{
    public class ProductStockChangeCriteriaBo
    {
        public int ProductId { get; set; }
        public int Change { get; set; }
        public bool IsInput { get; set; }
    }
}
