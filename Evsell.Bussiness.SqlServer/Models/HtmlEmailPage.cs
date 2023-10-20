using System;
using System.Collections.Generic;

namespace Evsell.Busssiness.SqlServer.Models;

public partial class HtmlEmailPage
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Page { get; set; } = null!;
}
