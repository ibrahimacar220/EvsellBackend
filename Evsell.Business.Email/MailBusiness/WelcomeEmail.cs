using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.Email.MailBusiness
{
    public class WelcomeEmail
    {
        public void SendWelcomeEmail(string mailTo, string firtsName, string htmlPage)
        {
            using (Email email = new Email())
            {
                htmlPage = htmlPage.Replace("{FirtsName}", $" {firtsName}");

                email.Send(mailTo, htmlPage);
            }
        }
    }
}
