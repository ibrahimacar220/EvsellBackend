namespace Evsell.App.WebApi.Dto.ProductCategory
{
    public class ProductCategoryDto
    {
        public int Id { get; set; }

        public string Name { get; set; } = null!;

        public int? ParentId { get; set; }
    }
}
