using Evsell.Busssiness.SqlServer.EnumType;

namespace Evsell.App.WebApi.Dto.Invoice
{
    public class InvoiceUpdateStatusCriteriaDto
    {
        public int Id { get; set; }
        public EnumInvoiceStatusTypes EnumInvoiceStatus { get; set; }
    }
}
