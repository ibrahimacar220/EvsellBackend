using Evsell.Business.Common.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface ILogHttpBusiness : IDisposable
    {
        ResponseDto Save(string RequestRaw, DateTime RequestDateTime, string ResponseRaw, DateTime ResponseDateTime);
    }
}
