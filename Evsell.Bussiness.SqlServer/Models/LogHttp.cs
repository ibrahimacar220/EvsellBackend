using System;
using System.Collections.Generic;

namespace Evsell.Busssiness.SqlServer.Models;

public partial class LogHttp
{
    public int Id { get; set; }

    public string RequestRaw { get; set; } = null!;

    public DateTime RequestDateTime { get; set; }

    public string ResponseRaw { get; set; } = null!;

    public DateTime ResponseDateTime { get; set; }

    public DateTime CreateDateTime { get; set; }
}
