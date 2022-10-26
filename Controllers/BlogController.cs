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
        public ActionResult Blog_post(int ? page)
        {
            MyDbContext md = new MyDbContext();
            var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);
               return View(model.ToPagedList(no_of_page, pageSize));
        }
    }
}