using Evsell.Busssiness.SqlServer.Dtos;

namespace Evsell.App.WebApi.Dto.Basket
{
    public class BasketCriteriaDto
    {
        public int BuyerId { get; set; }
        public List<InvoiceProductDto> InvoiceProductDtos { get; set; }
    }
}
