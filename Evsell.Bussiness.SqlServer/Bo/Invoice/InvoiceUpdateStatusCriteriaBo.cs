using Evsell.Busssiness.SqlServer.EnumType;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Bo.Invoice
{
    public class InvoiceUpdateStatusCriteriaBo
    {
        public int Id { get; set; }
        public EnumInvoiceStatusTypes EnumInvoiceStatus { get; set; }
    }
}
