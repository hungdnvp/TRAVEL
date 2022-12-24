using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TRAVEL.Models
{
     public class RecentBlog
     {
          public int blogId { get; set; }
          public string ten { get; set; }
          public string author { get; set; }
          public string image { get; set; }
          public DateTime ngaydang { get; set; }
          public DateTime lastVisited { get; set; }
     }
}