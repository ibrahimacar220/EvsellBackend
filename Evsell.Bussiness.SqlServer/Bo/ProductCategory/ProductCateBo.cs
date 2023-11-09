using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.SqlServer.Bo.ProductCategory
{
    public class ProductCateBo
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public List<ProductCateBo> SubList { get; set; }
    }
}
