using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TRAVEL.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Blog_post()
        {
            return View();
        }
    }
}