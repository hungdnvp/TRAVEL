using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Areas.Admin.Controllers
{
     public class TourController : Controller
     {
          // GET: Admin/Tour
          public ActionResult List()
          {
               using (MyDbContext Travel = new MyDbContext())
               {
                    List<Tour> list = new List<Tour>();
                    list = Travel.Tours.ToList();
                    return View(list);
               }
          }

          public ActionResult Delete(int idTour)
          {
               using (MyDbContext Travel = new MyDbContext())
               {
                    Tour t = Travel.Tours.Find(idTour);
                    if (t != null)
                    {
                         t.DichVus.Clear();
                         t.DanhGias.Clear();
                         t.PhieuDatTours.Clear();
                         t.BangGias.Clear();
                         t.DiaDanhs.Clear();
                         t.TravelTypes.Clear();
                         Travel.Tours.Remove(t);
                         Travel.SaveChanges();
                    }
                    return RedirectToAction("List");
               }
          }

          public ActionResult Edit(int idTour)
          {
               using (MyDbContext Travel = new MyDbContext())
               {

                    Tour t = Travel.Tours.Find(idTour);
                    return View(t);
               }
          }
     }
}
