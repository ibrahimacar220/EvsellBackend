
using Evsell.App.WebApi.Dto.Basket;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Business;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;
using Evsell.Business.Redis.Business;
using Evsell.Business.Redis.Bo.Basket;
using Evsell.Business.Redis.Business.Interface;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class BasketController : ControllerBase
    {
        private readonly IMapper _mapper;

        public BasketController(IMapper mapper, IBasketBusiness basketBusiness, IRedisBasketBusiness redisBasketBusiness)
        {
            _mapper = mapper;
            _basketBusiness = basketBusiness;
            _redisBasketBusiness = redisBasketBusiness;
        }
        public IRedisBasketBusiness _redisBasketBusiness;
        public IBasketBusiness _basketBusiness;

        [HttpPost("Save")]
        public ResponseDto Save(BasketCriteriaDto Dto)
        {

            BasketCriteriaBo CriteriaBo = _mapper.Map<BasketCriteriaBo>(Dto);
          
            RedisBasketCriteriaBo redisBasketCriteriaBo = _mapper.Map<RedisBasketCriteriaBo>(Dto);

            ResponseDto responseDto = _basketBusiness.Save(CriteriaBo);

            if (responseDto.IsSuccess == true)
            {
                _redisBasketBusiness.Save(redisBasketCriteriaBo);
            }

            return responseDto;
        }

        [HttpDelete("Delete")]
        public ResponseDto Delete(DeleteBasketDto Dto)
        {
            DeleteBasketBo deleteBasketBo = _mapper.Map<DeleteBasketBo>(Dto);

            RedisDeleteBasketBo redisDeleteBasketBo = _mapper.Map<RedisDeleteBasketBo>(Dto);

            ResponseDto responseDto = _basketBusiness.Delete(deleteBasketBo);

            if (responseDto.IsSuccess == true)
            {
                _redisBasketBusiness.Delete(redisDeleteBasketBo);
            }
            
            return responseDto;
        }

        [HttpGet("GetList")]
        public ResponseDto<List<BasketBo>> GetBaskets([FromQuery] GetBasketDto Dto)
        {
            ResponseDto<List<RedisBasketBo>> basketBo = _redisBasketBusiness.Get(Dto.BuyerId.ToString());

            if (basketBo.Dto == null)
            {
                GetBasketBo getBasketBo = _mapper.Map<GetBasketBo>(Dto);
                return _basketBusiness.GetBaskets(getBasketBo);

            }
            else
            {
                ResponseDto<List<BasketBo>> basketDto = _mapper.Map<ResponseDto<List<BasketBo>>>(basketBo);
                return basketDto;
            }
        }
    }
}