using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.EnumType
{
    public enum EnumInvoiceStatusTypes
    {
        OrderReceived = 0,
        PaymentMade = 1,
        Shipped = 2,
        Deliveried = 3,
        Canceled = 4,
        Refund = 5,
    }
}
