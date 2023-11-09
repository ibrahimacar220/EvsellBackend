namespace Evsell.App.WebApi.Dto.ProductCategory
{
    public class ProductCateDto
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public List<ProductCateDto> SubList { get; set; }
    }
}