using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
    public class DestinationsController : Controller
    {
        // GET: Destinations

      

        public ActionResult Destination_mansory( )
        {
            MyDbContext mdt = new MyDbContext();
            var model = mdt.DiaDanhs.ToList();
            return View(model);
        }
        public ActionResult Destination_Detail(int id )
        {
            if (id == null)
            {
                return RedirectToAction("Index", "Destination");
            }
            else
            {

                MyDbContext mdt = new MyDbContext();

                var model = mdt.DiaDanhs.Find(id);
                return View(model);

            }


        }
    }
}