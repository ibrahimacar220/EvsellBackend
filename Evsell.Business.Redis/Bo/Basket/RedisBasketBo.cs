﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Business.Redis.Bo.Basket
{
    public class RedisBasketBo
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int Qty { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
    }
}