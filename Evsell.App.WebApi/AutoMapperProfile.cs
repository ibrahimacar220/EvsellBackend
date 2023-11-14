using AutoMapper;
using Evsell.App.WebApi.Dto.Basket;
using Evsell.App.WebApi.Dto.Company;
using Evsell.App.WebApi.Dto.Invoice;
using Evsell.App.WebApi.Dto.Product;
using Evsell.App.WebApi.Dto.ProductCategory;
using Evsell.App.WebApi.Dto.ProductComment;
using Evsell.App.WebApi.Dto.User;
using Evsell.Business.Common.Response;
using Evsell.Business.Redis.Bo.Basket;
using Evsell.Business.SqlServer.Bo.ProductCategory;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using Evsell.Busssiness.SqlServer.Bo.Company;
using Evsell.Busssiness.SqlServer.Bo.Invoice;
using Evsell.Busssiness.SqlServer.Bo.Product;
using Evsell.Busssiness.SqlServer.Bo.ProductComment;
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
            CreateMap<CompanyGetBo, CompanyGetDto>().ReverseMap();
            CreateMap<CompanyDelBo, CompanyDelDto>().ReverseMap();
            CreateMap<CompanyBo, CompanyDto>().ReverseMap();
            CreateMap<CompanyGetListCriteriaBo, CompanyGetListCriteriaDto>().ReverseMap();
            CreateMap<ResponseDto<List<CompanyBo>>, ResponseDto<List<CompanyDto>>>().ReverseMap();
            CreateMap<ResponseDto<CompanyBo>, ResponseDto<CompanyDto>>().ReverseMap();

            CreateMap<InvoiceSaveCriteriaDto,InvoiceSaveCriteriaBo>().ReverseMap();
            CreateMap<InvoiceCancelCriteriaDto,InvoiceCancelCriteriaBo>().ReverseMap();
            CreateMap<ResponseDto<List<InvoiceDto>>, ResponseDto<List<InvoiceBo>>>().ReverseMap();
            CreateMap<InvoiceGetListCriteriaDto,InvoiceGetListCriteriaBo>().ReverseMap();
            CreateMap<ResponseDto<List<InvoiceDto>>, ResponseDto<List<InvoiceBo>>>().ReverseMap();

            CreateMap<ResponseDto<List<InvoiceBo>>, ResponseDto<List<InvoiceDto>>>().ReverseMap();
            CreateMap<InvoiceBo,InvoiceDto>().ReverseMap();
            CreateMap<InvoiceUpdateStatusCriteriaDto, InvoiceUpdateStatusCriteriaBo>().ReverseMap();
            CreateMap<InvoiceIsCancelledCriteriaDto, InvoiceIsCancelledCriteriaBo>().ReverseMap();
            CreateMap<ResponseDto<InvoiceIsCancelledDto>, ResponseDto<InvoiceIsCancelledBo>>().ReverseMap();
            CreateMap<InvoiceIsCancelledDto, InvoiceIsCancelledBo>().ReverseMap();

            CreateMap<ProductCommentDto, ProductCommentBo>().ReverseMap();
            CreateMap<ProductCommentDelCriteriaDto,ProductCommentDelCriteriaBo>().ReverseMap();
            CreateMap<ProductCommentGetCriteriaDto,ProductCommentGetCriteriaBo>().ReverseMap();
            CreateMap<ProductCommentSaveCriteriaDto,ProductCommentSaveCriteriaBo>().ReverseMap();
            CreateMap<ProductCommentGetListCriteriaDto,ProductCommentGetListCriteriaBo>().ReverseMap();
            CreateMap<ResponseDto<List<ProductCommentDto>>, ResponseDto<List<ProductCommentBo>>>().ReverseMap();
            CreateMap<ResponseDto<ProductCommentDto>,ResponseDto<ProductCommentBo>>().ReverseMap();

            CreateMap<ResponseDto<List<ProductCategoryDto>>,ResponseDto<List<ProductCategoryBo>>>().ReverseMap();
            CreateMap<ProductCategoryDto, ProductCategoryBo>().ReverseMap();

            CreateMap<ResponseDto<List<ProductCateDto>>, ResponseDto<List<ProductCateBo>>>().ReverseMap();
            CreateMap<ProductCateDto, ProductCateBo>().ReverseMap();
            CreateMap<RedisBasketCriteriaBo, BasketCriteriaDto>().ReverseMap();
            CreateMap<RedisBasketBo, BasketBo>().ReverseMap();
            CreateMap<RedisDeleteBasketBo, DeleteBasketDto>().ReverseMap();
            CreateMap<ResponseDto<List<RedisBasketBo>>, ResponseDto<List<BasketBo>>>().ReverseMap();
        }
    }
}
