using System;
using System.Collections.Generic;

namespace Evsell.Busssiness.SqlServer.Models;

public partial class EnumUserType
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
