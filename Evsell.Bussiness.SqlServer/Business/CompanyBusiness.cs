using Evsell.Business.Common.Response;
using Evsell.Business.Email.MailBusiness;
using Evsell.Busssiness.SqlServer.Bo.Company;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Evsell.Busssiness.SqlServer.EnumType;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business
{
    public class CompanyBusiness : ICompanyBusiness
    {
        readonly EvsellDbContext dbContext;
        public CompanyBusiness()
        {
            dbContext = new EvsellDbContext();
        }

        public ResponseDto Save(CompanyBo companyBo)
        {
            CompanyEmail mailSender = new CompanyEmail();

            try
            {
                Company company = null;

                if (companyBo.Id <= 0)
                {//insert

                    User user = dbContext.Users.Find(companyBo.UserId);
                    if (user == null)
                    {
                        return new ResponseDto().Failed("User Not Found.");
                    }
                    if ((EnumUserTypes)user.UserType != EnumUserTypes.Company && (EnumUserTypes)user.UserType != EnumUserTypes.Admin)
                    {
                        return new ResponseDto().Failed("Only Company Users Can Crate a Company.");
                    }

                    company = new Company()
                    {
                        UserId = companyBo.UserId,
                        Name = companyBo.Name,
                        IsActive = true,
                        CreateDate = DateTime.Now,
                        CreateUserId = 1
                    };

                    HtmlEmailPage htmlEmailPage = GetHtmlPage((int)EnumHtmlPage.RegisterCompanyEmail).Dto;
                    mailSender.SendRegisterCompany(user.UserName, company.Name, htmlEmailPage.Page);

                    dbContext.Companies.Add(company);
                }

                else
                {//update
                    company = GetCompany(companyBo.Id).Dto;
                    if (company == null)
                    {
                        return null;
                    }
                    company.UserId = companyBo.UserId;
                    company.Name = company.Name;
                }

                dbContext.SaveChanges();

                return new ResponseDto().Success(company?.Id);
            }

            catch (Exception ex)
            {
                return new ResponseDto().FailedWithException(ex, "pls try again");
            }
        }

        public ResponseDto<CompanyBo> Get(CompanyGetBo companyGetBo)
        {
            try
            {
                Company company = dbContext.Companies.Find(companyGetBo.Id);
                if (company == null)
                {
                    return new ResponseDto<CompanyBo>().Failed("Company Not Found");
                }
                CompanyBo companyBo = new CompanyBo()
                {
                    Id = company.Id,
                    IsActive = company.IsActive,
                    Name = company.Name,
                    UserId = company.UserId
                    
                };
                return new ResponseDto<CompanyBo>().Success(companyBo);

            }
            catch (Exception ex)
            {
                return new ResponseDto<CompanyBo>().FailedWithException(ex);
            }
        }

        public ResponseDto<Company> GetCompany(int id)
        {
            try
            {
                Company company = dbContext.Companies.Find(id);
                if (company == null)
                {
                    return new ResponseDto<Company>().Failed("Company Not Found");
                }
                return new ResponseDto<Company>().Success(company);

            }
            catch (Exception ex)
            {
                return new ResponseDto<Company>().FailedWithException(ex);
            }
        }

        public ResponseDto<User> GetUser(int id)
        {
            try
            {
                User user = dbContext.Users.Find(id);
                return new ResponseDto<User>().Success(user);
            }
            catch (Exception ex)
            {
                return new ResponseDto<User>().FailedWithException(ex);
            }
        }

        public ResponseDto<HtmlEmailPage> GetHtmlPage(int id)
        {
            try
            {
                HtmlEmailPage htmlEmailPage = dbContext.HtmlEmailPages.Find(id);
                return new ResponseDto<HtmlEmailPage>().Success(htmlEmailPage);
            }
            catch (Exception ex)
            {
                return new ResponseDto<HtmlEmailPage>().FailedWithException(ex);
            }
        }

        public ResponseDto<List<CompanyBo>> GetList(CompanyGetListCriteriaBo companyGetListCriteriaBo)
        {
            try
            {
                List<CompanyBo> companyDtos = new List<CompanyBo>();
                List<Company> companies = (from x in dbContext.Companies
                                           where companyGetListCriteriaBo.IsActive == null || x.IsActive == companyGetListCriteriaBo.IsActive.Value
                                           select x).ToList();
                foreach (var item in companies)
                {
                    CompanyBo companyBo = new CompanyBo()
                    {
                        Id = item.Id,
                        UserId = item.UserId,
                        Name = item.Name,
                        IsActive = item.IsActive
                    };
                    companyDtos.Add(companyBo);
                }
                return new ResponseDto<List<CompanyBo>>().Success(companyDtos);
            }
            catch (Exception ex)
            {
                return new ResponseDto<List<CompanyBo>>().FailedWithException(ex);
            }
        }

        public ResponseDto Delete(CompanyDelBo companyDelBo)
        {
            try
            {
                Company company = GetCompany(companyDelBo.Id).Dto;
                if (company == null)
                {
                    return new ResponseDto().Failed("Company Not Found");
                }

                dbContext.Companies.Remove(company);
                dbContext.SaveChanges();

                return new ResponseDto().Success(companyDelBo.Id);
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
