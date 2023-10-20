using AutoMapper;
using Evsell.App.WebApi.Dto.Basket;
using Evsell.App.WebApi.Dto.Company;
using Evsell.App.WebApi.Dto.Product;
using Evsell.App.WebApi.Dto.User;
using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using Evsell.Busssiness.SqlServer.Bo.Company;
using Evsell.Busssiness.SqlServer.Bo.Product;
using Evsell.Busssiness.SqlServer.Bo.User;

namespace Evsell.App.WebApi
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<ResponseDto<List<UserDto>>, ResponseDto<List<UserBo>>>().ReverseMap();

            CreateMap<ResponseDto<List<UserGetListDto>>, ResponseDto<List<UserGetListBo>>>().ReverseMap();

            CreateMap<UserDto, UserBo>().ReverseMap();

            CreateMap<ResponseDto<UserDto>, ResponseDto<UserBo>>().ReverseMap();

            CreateMap<UserGetDto, UserGetBo>().ReverseMap();

            CreateMap<UserDelDto, UserDelBo>().ReverseMap();

            CreateMap<UserGetListCriteriaDto, UserGetListCriteriaBo>().ReverseMap();

            CreateMap<UserGetListDto, UserGetListBo>().ReverseMap();

            CreateMap<ResponseDto<List<UserGetListDto>>, ResponseDto<List<UserGetListBo>>>().ReverseMap();

            CreateMap<ResponseDto<UserGetListDto>, ResponseDto<UserGetListBo>>().ReverseMap();

            CreateMap<BasketCriteriaDto, BasketCriteriaBo>().ReverseMap();

            CreateMap<GetBasketDto, GetBasketBo>().ReverseMap();

            CreateMap<DeleteBasketDto, DeleteBasketBo>().ReverseMap();

            CreateMap<ProductDto, ProductBo>().ReverseMap();

            CreateMap<ProductStockChangeCriteriaDto, ProductStockChangeCriteriaBo>().ReverseMap();

            CreateMap<ProductDelCriteriaDto, ProductDelCriteriaBo>().ReverseMap();

            CreateMap<ProductGetListCriteriaDto,ProductGetListCriteriaBo>().ReverseMap();

            CreateMap<ProductGetListByDto, ProductGetListByBo>().ReverseMap();

            CreateMap<ResponseDto<List<ProductDto>>, ResponseDto<List<ProductBo>>>().ReverseMap();

            CreateMap<ResponseDto<ProductDto>, ResponseDto<ProductBo>>().ReverseMap();

            CreateMap<ProductGetDto,ProductGetBo>().ReverseMap();
            //CreateMap<ProductStockChangeDto, ProductStockChangeBo>().ReverseMap();

            //CreateMap<ProductDelDto, ProductDelBo>().ReverseMap();

            //CreateMap<ProductGetDto, ProductGetBo>().ReverseMap();

            //CreateMap<ResponseDto<ProductDto>, ResponseDto<ProductBo>>().ReverseMap();

            //CreateMap<ProductGetListDto, ProductGetListBo>().ReverseMap();

            //CreateMap<ResponseDto<ProductGetListDto>, ResponseDto<ProductGetListBo>>().ReverseMap();

            //CreateMap<ProductGetListCriteriaDto, ProductGetListCriteriaBo>().ReverseMap();

            //CreateMap<ResponseDto<List<ProductGetListDto>>, ResponseDto<List<ProductGetListBo>>>().ReverseMap();

            //CreateMap<ProductGetListByIdDto, ProductGetListByIdBo>().ReverseMap();

            CreateMap<CompanyGetBo, CompanyGetDto>().ReverseMap();
            CreateMap<CompanyDelBo, CompanyDelDto>().ReverseMap();
            CreateMap<CompanyBo, CompanyDto>().ReverseMap();
            CreateMap<CompanyGetListCriteriaBo, CompanyGetListCriteriaDto>().ReverseMap();
            CreateMap<ResponseDto<List<CompanyBo>>, ResponseDto<List<CompanyDto>>>().ReverseMap();
            CreateMap<ResponseDto<CompanyBo>, ResponseDto<CompanyDto>>().ReverseMap();
        }
    }
}
