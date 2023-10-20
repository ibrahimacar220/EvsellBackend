
using Evsell.App.WebApi.Dto.Basket;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Business;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class BasketController : ControllerBase
    {
        private readonly IMapper _mapper;

        public BasketController(IMapper mapper, IBasketBusiness basketBusiness)
        {
            _mapper = mapper;
            _basketBusiness = basketBusiness;
        }
        public IBasketBusiness _basketBusiness;

        [HttpPost("Save")]
        public ResponseDto Save(BasketCriteriaDto Dto)
        {
            BasketCriteriaBo CriteriaBo = _mapper.Map<BasketCriteriaBo>(Dto);
            return _basketBusiness.Save(CriteriaBo);
        }

        [HttpDelete("Delete")]
        public ResponseDto Delete(DeleteBasketDto Dto)
        {
            DeleteBasketBo deleteBasketBo = _mapper.Map<DeleteBasketBo>(Dto);
            return _basketBusiness.Delete(deleteBasketBo);
        }

        [HttpGet("GetList")]
        public ResponseDto<List<BasketBo>> GetBaskets([FromQuery] GetBasketDto Dto)
        {
            GetBasketBo getBasketBo = _mapper.Map<GetBasketBo>(Dto);
            return _basketBusiness.GetBaskets(getBasketBo);
        }
    }
}