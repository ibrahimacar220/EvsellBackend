using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Invoice;
using Evsell.Busssiness.SqlServer.EnumType;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface IInvoiceBusiness:IDisposable
    {
        ResponseDto Save(InvoiceSaveCriteriaBo invoiceSaveCriteriaBo);
        ResponseDto Cancel(InvoiceCancelCriteriaBo invoiceCancelCriteriaBo);
        ResponseDto<List<InvoiceBo>> GetList(InvoiceGetListCriteriaBo invoiceGetListCriteriaBo);

        ResponseDto UpdateStatus(InvoiceUpdateStatusCriteriaBo invoiceUpdateStatusCriteriaBo);
        ResponseDto<InvoiceIsCancelledBo> IsCancelled(InvoiceIsCancelledCriteriaBo invoiceIsCancelledCriteriaBo);
    }
}
