using AutoMapper;
using Evsell.App.WebApi.Dto.Company;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Company;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Evsell.App.WebApi.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CompanyController : ControllerBase
    {
        private readonly IMapper _mapper;
        public CompanyController(IMapper mapper,ICompanyBusiness companyBusiness)
        {
            _companyBusiness = companyBusiness;
            _mapper = mapper;
        }
        public ICompanyBusiness _companyBusiness;

        [HttpPost("Save")]
        public ResponseDto Save(CompanyDto companyDto)
        {
            CompanyBo companyBo = _mapper.Map<CompanyBo>(companyDto);
            return _companyBusiness.Save(companyBo);
        }

        [HttpDelete("Delete")]
        public ResponseDto Delete(CompanyDelDto companyDelDto)
        {
            CompanyDelBo companyDelBo = _mapper.Map<CompanyDelBo>(companyDelDto);
            return _companyBusiness.Delete(companyDelBo);
        }

        [HttpGet("GetList")]
        public ResponseDto<List<CompanyDto>> GetList([FromQuery] CompanyGetListCriteriaDto companyGetListCriteriaDto)
        {
            CompanyGetListCriteriaBo companyGetListCriteriaBo = _mapper.Map<CompanyGetListCriteriaBo>(companyGetListCriteriaDto);
            ResponseDto<List<CompanyDto>> companyDtos = _mapper.Map<ResponseDto<List<CompanyDto>>>(_companyBusiness.GetList(companyGetListCriteriaBo));

            return companyDtos;
        }

        [HttpGet("Get")]
        public ResponseDto<CompanyDto> Get([FromQuery]CompanyGetDto companyGetDto)
        {
            CompanyGetBo companyGetBo = _mapper.Map<CompanyGetBo>(companyGetDto);
            
            ResponseDto<CompanyDto> companyDto = _mapper.Map<ResponseDto<CompanyDto>>(_companyBusiness.Get(companyGetBo));
            return companyDto;
        }

    }
}
