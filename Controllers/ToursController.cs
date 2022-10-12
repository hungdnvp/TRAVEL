using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TRAVEL.Controllers
{
    public class ToursController : Controller
    {
        // GET: Tours
        public ActionResult Tours_grid()
        {
            return View();
        }
    }
}