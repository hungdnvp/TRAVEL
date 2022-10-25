using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Blog_post()
        {
            MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
            return View(model);
        }
    }
}