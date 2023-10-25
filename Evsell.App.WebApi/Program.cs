using Evsell.App.WebApi;
using Evsell.App.WebApi.Middleware;
using Evsell.Busssiness.SqlServer.Business;
using Evsell.Busssiness.SqlServer.Business.Interface;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authentication.Negotiate;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();


builder.Services.AddAuthentication(NegotiateDefaults.AuthenticationScheme)
   .AddNegotiate();
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
           .AddJwtBearer(x =>
           {
               x.RequireHttpsMetadata = true;
               x.SaveToken = true;
               x.TokenValidationParameters = new TokenValidationParameters
               {
                   ValidateIssuer = true,
                   ValidateAudience = true,
                   ValidateLifetime = false,
                   ValidateIssuerSigningKey = true,
                   ValidIssuer = Stc.JwtIssuer,
                   ValidAudience = Stc.JwtAudience,
                   ClockSkew = TimeSpan.Zero,
                   IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Stc.JwtKey))
               };
           });

builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "jwt_Auth_API",
        Version = "v1"
    });
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "here enter JWT Token with bearer format like bearer[space] token"
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {{  new OpenApiSecurityScheme
        {
            Reference= new OpenApiReference
            {
                Type = ReferenceType.SecurityScheme,
                Id = "Bearer"
            }
        },
        new string[]{}
        }
    });
});

builder.Services.AddScoped<IBasketBusiness, BasketBusiness>();
builder.Services.AddScoped<IProductBusiness, ProductBusiness>();
builder.Services.AddScoped<IUserBusiness, UserBusiness>();
builder.Services.AddScoped<IProductCommentBusiness, ProductCommentBusiness>();
builder.Services.AddScoped<ICompanyBusiness, CompanyBusiness>();
builder.Services.AddScoped<ILogHttpBusiness, LogHttpBusiness>();
//builder.Services.AddScoped<IProductCategoryBusiness, ProdutCategoryBusiness>();
builder.Services.AddScoped<IInvoiceBusiness, InvoiceBusiness>();

builder.Services.AddAutoMapper(typeof(Program).Assembly);

var app = builder.Build();

app.UseCors(x => x
    .AllowAnyMethod()
    .AllowAnyHeader()
    .SetIsOriginAllowed(origin => true) // allow any origin
                                        //.WithOrigins("https://localhost:44351")); // Allow only this origin can also have multiple origins separated with comma
    .AllowCredentials()); // allow credentials

builder.Services.AddCors();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseMiddleware<RequestResponseLogMiddleware>();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
