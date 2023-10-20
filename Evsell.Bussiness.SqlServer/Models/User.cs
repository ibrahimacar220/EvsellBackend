using System;
using System.Collections.Generic;

namespace Evsell.Busssiness.SqlServer.Models;

public partial class User
{
    public int Id { get; set; }

    public int UserType { get; set; }

    public string UserName { get; set; } = null!;

    public string Password { get; set; } = null!;

    public string FirtsName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public bool? IsActive { get; set; }

    public DateTime CreateDate { get; set; }

    public int CreateUserId { get; set; }

    public DateTime? UpdateDate { get; set; }

    public int? UpdateUserId { get; set; }

    public virtual ICollection<Company> Companies { get; set; } = new List<Company>();

    public virtual ICollection<ProductComment> ProductComments { get; set; } = new List<ProductComment>();

    public virtual EnumUserType UserTypeNavigation { get; set; } = null!;
}
