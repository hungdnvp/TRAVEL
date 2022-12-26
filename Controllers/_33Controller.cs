using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;
using PagedList;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Windows.Forms;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
     [AllowAnonymous]
     public class _33Controller : Controller
     {


          public ActionResult Blog_detail_Thao(int? id)
          {

               var md = new MyDbContext();
               var Blog_dt_model = md.Blogs.Where(b => b.Blog_ID == id).FirstOrDefault();
               if (Blog_dt_model == null)
               {
                    return HttpNotFound();
               }
               return View(Blog_dt_model);
          }

     }
}