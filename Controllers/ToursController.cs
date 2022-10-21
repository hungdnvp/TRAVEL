using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
    public class ToursController : Controller
    {
        // GET: Tours
        public ActionResult Tours_grid()
        {
               MyDbContext md = new MyDbContext();
               var model = md.Tours.ToList();
       
            return View(model);
        }
    }
}