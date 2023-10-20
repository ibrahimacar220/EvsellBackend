using AutoMapper;
using Evsell.App.WebApi.Dto.User;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.User;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IMapper _mapper;
        public UserController(IMapper mapper,IUserBusiness userBusiness)
        {
            _mapper = mapper;
            _userBusiness = userBusiness;
        }
        public IUserBusiness _userBusiness;

        [HttpPost("Save")]
        public ResponseDto Save([FromQuery] UserDto userDto)
        {
            UserBo userBo = _mapper.Map<UserBo>(userDto);
            return _userBusiness.Save(userBo);
        }

        [HttpDelete("Delete")]
        public ResponseDto Delete([FromQuery] UserDelDto userDelDto)
        {
            UserDelBo userDelBo = _mapper.Map<UserDelBo>(userDelDto);
            return _userBusiness.Delete(userDelBo);
        }

        [HttpGet("Get")]
        public ResponseDto<UserDto> Get([FromQuery] UserGetDto userGetDto)
        {
            UserGetBo userGetBo = _mapper.Map<UserGetBo>(userGetDto);
            ResponseDto<UserDto> userDto = _mapper.Map<ResponseDto<UserDto>>(_userBusiness.Get(userGetBo));
            return userDto;
        }

        [HttpGet("GetList")]
        public ResponseDto<List<UserGetListDto>> GetList([FromQuery] UserGetListCriteriaDto userGetListCriteriaDto)
        {
            UserGetListCriteriaBo userGetListCriteriaBo = _mapper.Map<UserGetListCriteriaBo>(userGetListCriteriaDto);
            ResponseDto<List<UserGetListDto>> userDto = _mapper.Map<ResponseDto<List<UserGetListDto>>>(_userBusiness.GetList(userGetListCriteriaBo)); 
            return userDto;
        }
    }
}
