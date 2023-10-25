using AutoMapper;
using Evsell.App.WebApi.Dto.Product;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Product;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Evsell.App.WebApi.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ProductController : ControllerBase
    {
        private readonly IMapper _mapper;
        public ProductController(IMapper mapper, IProductBusiness productBusiness)
        {
            _mapper = mapper;
            _productBusiness = productBusiness;
        }
        public IProductBusiness _productBusiness;

        [HttpPost("Save")]
        public ResponseDto Save(ProductDto productDto)
        {
            ProductBo productBo = _mapper.Map<ProductBo>(productDto);

            return _productBusiness.Save(productBo);
        }

        [HttpPost("ProductStockChange")]
        public ResponseDto ProductStockChange(ProductStockChangeCriteriaDto productStockChangeCriteriaDto)
        {
            ProductStockChangeCriteriaBo productStockChangeCriteriaBo = _mapper.Map<ProductStockChangeCriteriaBo>(productStockChangeCriteriaDto);

            return _productBusiness.ProductStockChange(productStockChangeCriteriaBo);
        }

        [HttpDelete("Delete")]
        public ResponseDto Delete(ProductDelCriteriaDto productDelCriteriaDto)
        {
            ProductDelCriteriaBo productDelCriteriaBo = _mapper.Map<ProductDelCriteriaBo>(productDelCriteriaDto);

            return _productBusiness.Delete(productDelCriteriaBo);
        }

        [HttpGet("Get")]
        public ResponseDto<ProductDto> Get([FromQuery] ProductGetDto productGetDto)
        {
            ProductGetBo productGetBo = _mapper.Map<ProductGetBo>(productGetDto);

            ResponseDto<ProductDto> productDto = _mapper.Map<ResponseDto<ProductDto>>(_productBusiness.Get(productGetBo));

            return productDto;
        }

        [HttpGet("GetList")]
        public ResponseDto<List<ProductDto>> GetList([FromQuery]ProductGetListCriteriaDto productGetListCriteriaDto)
        {
            ProductGetListCriteriaBo productGetListCriteriaBo = _mapper.Map<ProductGetListCriteriaBo>(productGetListCriteriaDto);

            ResponseDto<List<ProductDto>> productDtos = _mapper.Map<ResponseDto<List<ProductDto>>>(_productBusiness.GetList(productGetListCriteriaBo));

            return productDtos;
        }

        [HttpGet("GetListByCategoryId")]
        public ResponseDto<List<ProductDto>> GetListByCategoryId([FromQuery]ProductGetListByDto productGetByDto)
        {
            ProductGetListByBo productGetByBo = _mapper.Map<ProductGetListByBo>(productGetByDto);
           
            ResponseDto<List<ProductDto>> productDtos = _mapper.Map<ResponseDto<List<ProductDto>>>(_productBusiness.GetListByCategoryId(productGetByBo));
           
            return productDtos;
        }

        [HttpGet("GetListByCompanyId")]
        public ResponseDto<List<ProductDto>> GetListByCompanyId([FromQuery] ProductGetListByDto productGetListByDto)
        {
            ProductGetListByBo productGetListByBo = _mapper.Map<ProductGetListByBo>(productGetListByDto);
            
            ResponseDto<List<ProductDto>> productDtos = _mapper.Map<ResponseDto<List<ProductDto>>>(_productBusiness.GetListByCompanyId(productGetListByBo));
            
            return productDtos;
        }

        [HttpGet("StockControl")]
        public ResponseDto StockControl([FromQuery] ProductGetDto productGetDto)
        {
            ProductGetBo productGetBo = _mapper.Map<ProductGetBo>(productGetDto);
            
            return _productBusiness.StockControl(productGetBo);
        }
    }

}
