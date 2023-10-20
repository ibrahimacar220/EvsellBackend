using Evsell.Business.Common.Response;
using Evsell.Busssiness.SqlServer.Bo.Product;
using Evsell.Busssiness.SqlServer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Business.Interface
{
    public interface IProductBusiness : IDisposable
    {
        ResponseDto Save(ProductBo productBo);
        ResponseDto Delete(ProductDelCriteriaBo productDelCriteriaBo);
        ResponseDto<ProductBo> Get(ProductGetBo productGetBo);
        ResponseDto<List<ProductBo>> GetList(ProductGetListCriteriaBo productGetListCriteriaBo);

        ResponseDto ProductStockChange(ProductStockChangeCriteriaBo productStockChangeCriteriaBo);
        ResponseDto StockControl(ProductGetBo productGetBo);
        ResponseDto<List<ProductBo>> GetListByCompanyId(ProductGetListByBo productGetListByBo);
        ResponseDto<List<ProductBo>> GetListByCategoryId(ProductGetListByBo productGetListByBo);

    }
}
