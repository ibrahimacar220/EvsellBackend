using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Evsell.App.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : Controller
    {

        [HttpGet]
        public string Login(string userName, string password)
        {
            return JwtTokenBuilder.BuildToken(userName);
        }

    }

        public class JwtTokenBuilder
        {
            public static string BuildToken(string userName)
            {
                var claims = new[] {
                new Claim(JwtRegisteredClaimNames.Jti, userName)
            };

                SymmetricSecurityKey key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Stc.JwtKey));
                SigningCredentials creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                JwtSecurityToken token = new JwtSecurityToken(
                Stc.JwtIssuer,
                Stc.JwtAudience,
                claims: claims,
                expires: DateTime.UtcNow.AddYears(50),
                signingCredentials: creds
            );

                return new JwtSecurityTokenHandler().WriteToken(token);
            }
        }
}
