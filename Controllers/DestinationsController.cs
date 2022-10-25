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
          private MyDbContext travel = new MyDbContext();
        public ActionResult Destination_mansory()
        {
               MyDbContext mdt = new MyDbContext();
               var model = mdt.DiaDanhs.ToList();

            return View(model);
        }
    }
}