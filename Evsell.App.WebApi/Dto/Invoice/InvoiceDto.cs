namespace Evsell.App.WebApi.Dto.Invoice
{
    public class InvoiceDto
    {
        public int Id { get; set; }

        public int BuyerUserId { get; set; }

        public int SellerCompanyId { get; set; }

        public DateTime TransactionDateTime { get; set; }

        public decimal Total { get; set; }

        public decimal VatTotal { get; set; }

        public decimal GrandTotal { get; set; }

        public bool IsCancelled { get; set; }

        public int StatusId { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime? CancelDate { get; set; }
    }
}
