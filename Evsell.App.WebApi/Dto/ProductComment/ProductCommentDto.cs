namespace Evsell.App.WebApi.Dto.ProductComment
{
    public class ProductCommentDto
    {
        public int Id { get; set; }

        public int UserId { get; set; }

        public int ProductId { get; set; }

        public bool? IsActive { get; set; }

        public string Header { get; set; } = null!;

        public string Comments { get; set; } = null!;

        public int ProductRate { get; set; }

    }
}
