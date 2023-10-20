using System;
using System.Collections.Generic;

namespace Evsell.Busssiness.SqlServer.Models;

public partial class ProductComment
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public int ProductId { get; set; }

    public bool? IsActive { get; set; }

    public string Header { get; set; } = null!;

    public string Comments { get; set; } = null!;

    public int ProductRate { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
