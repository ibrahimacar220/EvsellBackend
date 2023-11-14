using Evsell.Business.Common.Response;
using Evsell.Business.Redis.Bo.Basket;
using Evsell.Business.Redis.Business.Interface;
using Evsell.Busssiness.SqlServer.Bo.Basket;
using Evsell.Busssiness.SqlServer.Bo.User;
using Evsell.Busssiness.SqlServer.Business;
using Evsell.Busssiness.SqlServer.Dtos;
using Evsell.Busssiness.SqlServer.Models;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.Redis.Business
{
    public class RedisBasketBusiness : IRedisBasketBusiness
    {
        readonly EvsellDbContext dbContext;
        private BaseBusiness baseBusiness;

        public RedisBasketBusiness()
        {
            dbContext = new EvsellDbContext();
            baseBusiness = new BaseBusiness();
        }

        public ResponseDto Save(RedisBasketCriteriaBo redisBasketCriteriaBo)
        {
            string key = redisBasketCriteriaBo.BuyerId.ToString();

            List<RedisBasketBo> redisBasketBos = BaseBusiness.GetData<List<RedisBasketBo>>(key);

            var groupedProducts = redisBasketCriteriaBo.InvoiceProductDtos.GroupBy(p => p.productId);

            foreach (var group in groupedProducts)
            {
                int newQty = 0;

                if (group.Count() >= 2)
                {
                    newQty = group.Sum(basket => basket.qty);


                    // deleting product from orginal list
                    redisBasketCriteriaBo.InvoiceProductDtos.RemoveAll(p => p.productId == group.Key);

                    // add with new qty
                    redisBasketCriteriaBo.InvoiceProductDtos.Add(new InvoiceProductDto { productId = group.Key, qty = newQty });
                }
            }

            foreach (var item in redisBasketCriteriaBo.InvoiceProductDtos)
            {
                if (redisBasketBos != null)
                {
                    var redisBasketBo = redisBasketBos.FirstOrDefault(p => p.ProductId == item.productId);
                    if (redisBasketBo != null)
                    {
                        item.qty += redisBasketBo.Qty;
                    }
                }
            }

            var productIds = redisBasketCriteriaBo.InvoiceProductDtos.Select(p => p.productId).ToList();

            List<RedisBasketBo> basketDtos = (from P in dbContext.Products
                                              where productIds.Contains(P.Id)
                                              select new RedisBasketBo
                                              {
                                                  ProductId = P.Id,
                                                  ProductName = P.Name,
                                                  Image = P.Image,
                                                  Price = P.Price,
                                                  // Diğer özellikleri buraya ekleyin
                                              }).ToList();

            foreach (var item in redisBasketCriteriaBo.InvoiceProductDtos)
            {
                var redisBasketBo = basketDtos.FirstOrDefault(p => p.ProductId == item.productId);
                redisBasketBo.Qty = item.qty;
            }

            BaseBusiness.SetData(key, basketDtos);

            return new ResponseDto().Success();

            //RedisBasketCriteriaBo basketCriteriaBo = new RedisBasketCriteriaBo();
            //List<InvoiceProductDto> list = new List<InvoiceProductDto>();

            //if (redisBasketBos != null && redisBasketBos.Count != 0)
            //{
            //    foreach (var item in redisBasketCriteriaBo.InvoiceProductDtos)
            //    {
            //        foreach (var subItem in redisBasketBos)
            //        {
            //            var hello = redisBasketBos.FirstOrDefault(p => p.ProductId == item.productId);
            //            if (hello != null)
            //            {
            //                InvoiceProductDto oldDto = new InvoiceProductDto()
            //                {
            //                    productId = hello.ProductId,
            //                    qty = item.qty + hello.Qty
            //                };
            //                list.Add(oldDto);
            //            }
            //            InvoiceProductDto dto = new InvoiceProductDto()
            //            {
            //                productId = item.productId,
            //                qty = item.qty
            //            };
            //            list.Add(dto);
            //        }
            //    }
            //    basketCriteriaBo.InvoiceProductDtos = list;

            //    redisBasketCriteriaBo = basketCriteriaBo;

            //}

            //var productIds = redisBasketCriteriaBo.InvoiceProductDtos.Select(p => p.productId).ToList();

            //List<BasketBo> basketDtos = (from P in dbContext.Products
            //                             where productIds.Contains(P.Id)
            //                             select new BasketBo
            //                             {
            //                                 ProductId = P.Id,
            //                                 ProductName = P.Name,
            //                                 Image = P.Image,
            //                                 Price = P.Price,
            //                                 // Diğer özellikleri buraya ekleyin
            //                             }).ToList();


            //foreach (var item in basketDtos)
            //{
            //    foreach (var subItem in redisBasketCriteriaBo.InvoiceProductDtos)
            //    {
            //        if (item.ProductId == subItem.productId)
            //        {
            //            item.Qty = subItem.qty;
            //        }
            //    }
            //}

        }

        public ResponseDto<List<RedisBasketBo>> Get(string key)
        {
            List<RedisBasketBo> basketCriteriaBo = BaseBusiness.GetData<List<RedisBasketBo>>(key);


            if (basketCriteriaBo == null)
            {
                return new ResponseDto<List<RedisBasketBo>>().Failed("Basket Null");
            }
            else
            {
                return new ResponseDto<List<RedisBasketBo>>().Success(basketCriteriaBo);
            }
        }

        public ResponseDto Delete(RedisDeleteBasketBo redisDeleteBasketBo)
        {
            string key = redisDeleteBasketBo.UserId.ToString();

            List<RedisBasketBo> redisBasketBos = BaseBusiness.GetData<List<RedisBasketBo>>(key);
            
            RedisBasketBo redisBasketBo = redisBasketBos.FirstOrDefault(p => p.ProductId == redisDeleteBasketBo.ProductId);

            if (redisBasketBo == null)
            {
                return new ResponseDto().Failed("Product Not Found");
            }

            redisBasketBo.Qty -= redisDeleteBasketBo.Qty;

            if (redisBasketBo.Qty == 0)
            {
                redisBasketBos.Remove(redisBasketBo);
            }

            BaseBusiness.SetData(key, redisBasketBos);
            return new ResponseDto().Success();
        }

    }
}