using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.SqlServer.Bo.ProductCategory
{
    public class ProductCategoryBo
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public int? ParentId { get; set; }
    }
}
