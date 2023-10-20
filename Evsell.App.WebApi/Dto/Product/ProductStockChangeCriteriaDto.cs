namespace Evsell.App.WebApi.Dto.Product
{
    public class ProductStockChangeCriteriaDto
    {
        public int ProductId { get; set; }
        public int Change { get; set; }
        public bool IsInput { get; set; }
    }
}
