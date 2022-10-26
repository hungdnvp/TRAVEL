using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;
using PagedList;

namespace TRAVEL.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index(int ? page)
        {
            MyDbContext md = new MyDbContext();
            var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);
               return View(model.ToPagedList(no_of_page, pageSize));
        }
          public ActionResult Blog_sidebar(int ? page)
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               return View(model.ToPagedList(no_of_page, pageSize));
          }
          public ActionResult Blog_detail(int id)
          {
               var md = new MyDbContext();
               var Blog_dt_model = md.Blogs.Single(b => b.Blog_ID== id);
               return View(Blog_dt_model);
          }
     }
}