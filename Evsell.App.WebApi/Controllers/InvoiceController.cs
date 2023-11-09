using AutoMapper;
using Evsell.App.WebApi.Dto.Invoice;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Invoice;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InvoiceController : ControllerBase
    {
        private readonly IMapper _mapper;
        public InvoiceController(IMapper mapper, IInvoiceBusiness invoiceBusiness)
        {
            _invoiceBusiness = invoiceBusiness;
            _mapper = mapper;
        }

        public IInvoiceBusiness _invoiceBusiness;

        [HttpPost("Save")]
        public ResponseDto Save(InvoiceSaveCriteriaDto invoiceSaveCriteriaDto)
        {
            InvoiceSaveCriteriaBo invoiceSaveCriteriaBo = _mapper.Map<InvoiceSaveCriteriaBo>(invoiceSaveCriteriaDto);

            return _invoiceBusiness.Save(invoiceSaveCriteriaBo);

        }

        [HttpPost("Cancel")]

        public ResponseDto Cancel(InvoiceCancelCriteriaDto invoiceCancelCriteriaDto)
        {
            InvoiceCancelCriteriaBo invoiceCancelCriteriaBo = _mapper.Map<InvoiceCancelCriteriaBo>(invoiceCancelCriteriaDto);

            return _invoiceBusiness.Cancel(invoiceCancelCriteriaBo);

        }

        [HttpPost("UpdateStatus")]
        public ResponseDto UpdateStatus(InvoiceUpdateStatusCriteriaDto invoiceUpdateStatusCriteriaDto)
        {
            InvoiceUpdateStatusCriteriaBo invoiceUpdateStatusCriteriaBo = _mapper.Map<InvoiceUpdateStatusCriteriaBo>(invoiceUpdateStatusCriteriaDto);

            return _invoiceBusiness.UpdateStatus(invoiceUpdateStatusCriteriaBo);
        }

        [HttpGet("GetList")]
        public ResponseDto<List<InvoiceDto>> GetList([FromQuery] InvoiceGetListCriteriaDto invoiceGetListCriteriaDto) 
        {
            InvoiceGetListCriteriaBo invoiceGetListCriteriaBo = _mapper.Map<InvoiceGetListCriteriaBo>(invoiceGetListCriteriaDto);

            ResponseDto<List<InvoiceDto>> invoiceDtos = _mapper.Map<ResponseDto<List<InvoiceDto>>>(_invoiceBusiness.GetList(invoiceGetListCriteriaBo));

            return invoiceDtos;
        }

        [HttpGet("IsCancelled")]
        public ResponseDto<InvoiceIsCancelledDto> IsCancelled([FromQuery]InvoiceIsCancelledCriteriaDto invoiceIsCancelledCriteriaDto)
        {
            InvoiceIsCancelledCriteriaBo invoiceIsCancelledCriteriaBo = _mapper.Map<InvoiceIsCancelledCriteriaBo>(invoiceIsCancelledCriteriaDto);

            ResponseDto<InvoiceIsCancelledDto> InvoiceIsCancelledDto = _mapper.Map<ResponseDto<InvoiceIsCancelledDto>>(_invoiceBusiness.IsCancelled(invoiceIsCancelledCriteriaBo));

            return InvoiceIsCancelledDto;
        }
    }
}
