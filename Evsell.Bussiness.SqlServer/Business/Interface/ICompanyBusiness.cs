using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Company;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface ICompanyBusiness : IDisposable
    {
        ResponseDto Save(CompanyBo companyBo);
        ResponseDto Delete(CompanyDelBo companyDelBo);
        ResponseDto<CompanyBo> Get(CompanyGetBo companyGetBo);
        ResponseDto<List<CompanyBo>> GetList(CompanyGetListCriteriaBo companyGetListCriteriaBo);
    }
}
