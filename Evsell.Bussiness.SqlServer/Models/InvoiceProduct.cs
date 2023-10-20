using System;
using System.Collections.Generic;

namespace Evsell.Busssiness.SqlServer.Models;

public partial class InvoiceProduct
{
    public int Id { get; set; }

    public int InvoiceId { get; set; }

    public int ProductId { get; set; }

    public string ProductName { get; set; } = null!;

    public decimal ProductPrice { get; set; }

    public int ProductVat { get; set; }

    public int Qty { get; set; }

    /// <summary>
    /// Total * 100 / Product.Vat (Second)
    /// </summary>
    public decimal Tax { get; set; }

    /// <summary>
    /// Product.Price * Qty (Firts)
    /// </summary>
    public decimal Total { get; set; }

    /// <summary>
    /// Tax+Total (Last)
    /// </summary>
    public decimal LineTotal { get; set; }

    public virtual Invoice Invoice { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
