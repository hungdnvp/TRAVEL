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
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.ToList();
                return View(tours);

            }

        }

        public ActionResult AjaxView(IEnumerable<Tour> tourlist)
        {
            return PartialView("_tourlist");
        }
    }
}