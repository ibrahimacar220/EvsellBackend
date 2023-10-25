namespace Evsell.App.WebApi.Dto.ProductComment
{
    public class ProductCommentSaveCriteriaDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public bool IsActive { get; set; }
        public string Header { get; set; }
        public string Comments { get; set; }
        public int ProductRate { get; set; }
    }
}
