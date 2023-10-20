using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface IUserBusiness : IDisposable
    {
        ResponseDto Save(UserBo userBo);
        ResponseDto Delete(UserDelBo userDelBo);
        ResponseDto<UserBo> Get(UserGetBo userGetBo);
        ResponseDto<List<UserGetListBo>> GetList(UserGetListCriteriaBo userGetListCriteriaBo);
    }
}
