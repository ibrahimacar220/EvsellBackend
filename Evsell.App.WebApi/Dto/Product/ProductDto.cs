namespace Evsell.App.WebApi.Dto.Product
{
    public class ProductDto
    {
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public int Stock { get; set; }
        public bool? IsActive { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
    }
}
