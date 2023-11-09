using AutoMapper;
using Evsell.App.WebApi.Dto.ProductCategory;
using Evsell.Business.Common.Response;
using Evsell.Business.Redis;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductCategoryController:ControllerBase
    {
        private readonly IMapper _mapper;

        public ProductCategoryController(IMapper mapper, IProductCategoryBusiness productCategoryBusiness)
        {
            _mapper = mapper;
            _productCategoryBusiness = productCategoryBusiness;
        }
        public IProductCategoryBusiness _productCategoryBusiness;

        [HttpGet("GetList")]
        public ResponseDto<List<ProductCategoryDto>> GetList()
        {
            // here we are doing map => ResponseDto<List<ProductCategoryBo>> = ResponseDto<List<ProductCategoryDto>>
            ResponseDto<List<ProductCategoryDto>> ProductCategoryDtos = _mapper.Map<ResponseDto<List<ProductCategoryDto>>>(_productCategoryBusiness.GetList());
           
            return ProductCategoryDtos;

        }

        [HttpGet("GetListChildren")]
        public ResponseDto<List<ProductCateDto>> GetListChildren() 
        {
            // here we are doing map => ResponseDto<List<ProductCateBo>> = ResponseDto<List<ProductCateDto>>
            ResponseDto<List<ProductCateDto>> ProductCateDtos = _mapper.Map<ResponseDto<List<ProductCateDto>>>(_productCategoryBusiness.GetListChildren());

            return ProductCateDtos;

        }

    }
}
