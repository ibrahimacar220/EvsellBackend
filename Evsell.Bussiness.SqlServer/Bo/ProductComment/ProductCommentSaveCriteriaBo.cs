﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Evsell.Busssiness.SqlServer.Bo.ProductComment
{
    public class ProductCommentSaveCriteriaBo
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public bool IsActive { get; set; }
        public string Header { get; set; }
        public string Comments { get; set; }
        public int ProductRate { get; set; }
      
    }
}
