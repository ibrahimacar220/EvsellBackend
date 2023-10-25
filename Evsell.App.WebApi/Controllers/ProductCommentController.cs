using AutoMapper;
using Evsell.App.WebApi.Dto.ProductComment;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.ProductComment;
using Evsell.Busssiness.SqlServer.Business;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductCommentController:ControllerBase
    {
        private readonly IMapper _mapper;
        public ProductCommentController(IMapper mapper, IProductCommentBusiness productCommentBusiness)
        {
            _mapper = mapper;
            _productCommentBusiness = productCommentBusiness;
        }
        public IProductCommentBusiness _productCommentBusiness;

        [HttpPost("Save")]

        public ResponseDto Save(ProductCommentSaveCriteriaDto productCommentSaveCriteriaDto)
        {
            ProductCommentSaveCriteriaBo productCommentSaveCriteriaBo = _mapper.Map<ProductCommentSaveCriteriaBo>(productCommentSaveCriteriaDto);

            return _productCommentBusiness.Save(productCommentSaveCriteriaBo);
        }

        [HttpDelete("Delete")]

        public ResponseDto Delete(ProductCommentDelCriteriaDto productCommentDelCriteriaDto)
        {
            ProductCommentDelCriteriaBo productCommentDelCriteriaBo = _mapper.Map<ProductCommentDelCriteriaBo>(productCommentDelCriteriaDto);

            return _productCommentBusiness.Delete(productCommentDelCriteriaBo);
        }

        [HttpGet("Get")]

        public ResponseDto<ProductCommentDto> Get([FromQuery]ProductCommentGetCriteriaDto productCommentGetCriteriaDto)
        {
            ProductCommentGetCriteriaBo productCommentGetCriteriaBo = _mapper.Map<ProductCommentGetCriteriaBo>(productCommentGetCriteriaDto);

            ResponseDto<ProductCommentDto> productCommentDto = _mapper.Map<ResponseDto<ProductCommentDto>>(_productCommentBusiness.Get(productCommentGetCriteriaBo));

            return productCommentDto;
        }

        [HttpGet("GetList")]
        public ResponseDto<List<ProductCommentDto>> GetList([FromQuery]ProductCommentGetListCriteriaDto productCommentGetListCriteriaDto) 
        {
            ProductCommentGetListCriteriaBo productCommentGetListCriteriaBo = _mapper.Map<ProductCommentGetListCriteriaBo>(productCommentGetListCriteriaDto);

            ResponseDto<List<ProductCommentDto>> productCommentDtos = _mapper.Map<ResponseDto<List<ProductCommentDto>>>(_productCommentBusiness.GetList(productCommentGetListCriteriaBo));

            return productCommentDtos;
        }

    }
}
