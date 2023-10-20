using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class LogHttpBusiness : ILogHttpBusiness
    {
        readonly EvsellDbContext dbContext;
        public LogHttpBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto Save(string requestRaw, DateTime requestDateTime, string responseRaw, DateTime responseDateTime)
        {
            try
            {
                LogHttp logHttp = new LogHttp()
                {
                    CreateDateTime = DateTime.Now,
                    RequestRaw = requestRaw,
                    ResponseRaw = responseRaw,
                    RequestDateTime = requestDateTime,
                    ResponseDateTime = responseDateTime,
                };

                dbContext.LogHttps.Add(logHttp);
                dbContext.SaveChanges();

                return new ResponseDto().Success();
            }

            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex);
            }
        }

        public void Dispose()
        {
            if (dbContext == null) return;

            dbContext.Dispose();
        }
    }
}
