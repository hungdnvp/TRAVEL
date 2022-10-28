using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;
using Newtonsoft;
using Newtonsoft.Json;

namespace TRAVEL.Controllers
{
    public class ToursController : Controller
    {
        // GET: Tours
        Dictionary<int, Nullable<int>> numstars = new Dictionary<int, Nullable<int>>();
        public void Load_Page()
        {
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.OrderBy(s => s.Gia).ToList();
                float star = 0f;
                foreach (Tour it in tours)
                {
                    star = 0f;
                    try
                    {
                        var dgs = Travel.DanhGias.Where(s => s.MaTour == it.MaTour).ToList();
                        foreach (var dg in dgs)
                        {
                            if (dg.NumStar != null) star += (float)dg.NumStar;
                        }
                        star /= dgs.Count();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("error get numstar");
                    }
                    this.numstars.Add(it.MaTour, (int)Math.Round(star));
                }
            }
        }

        public ActionResult Tours_grid()
        {
            Load_Page();
            ViewBag.Numstars = numstars;
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.OrderBy(s => s.Gia).ToList();
                List<TravelType> travel_type = Travel.TravelTypes.ToList();
                ViewBag.TravelTypes = travel_type;
                return View(tours);
            }

        }

        // list -or- grid
        [HttpPost]
        public ActionResult AjaxView(int type)
        {
            Load_Page();
            ViewBag.Numstars = numstars;
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.OrderBy(s => s.Gia).ToList();
                if (type == 2)
                {
                    return PartialView("_tourlist", tours);
                }
                else { return PartialView("_tourgrid", tours); }
            }
        }

        //Search Tour
        [HttpPost]
        public ActionResult TourSearch(string part, string des, int tourtype, int star, int dura)
        {
            Load_Page();
            ViewBag.Numstars = numstars;
            using (MyDbContext Travel = new MyDbContext())
            {
                List<Tour> tours = Travel.Tours.ToList();
                if (star != -1)
                {
                    foreach (var item in numstars)
                    {
                        if (item.Value != star)
                        {
                            try
                            {
                                tours.Remove(Travel.Tours.Find(item.Key));
                            }
                            catch { }
                        }
                    }
                }
                if (des != "")
                {
                    try
                    {
                        tours = tours.Where(c => c.DiaDiem.ToLower().Contains(des) || c.TenTour.ToLower().Contains(des)).ToList();
                    }
                    catch { }
                }
                if (dura != -1)
                {
                    try
                    {
                        tours = tours.Where(c => c.NumDay == dura).ToList();
                    }
                    catch { }
                }
                if (tourtype != -1)
                {
                    try
                    {
                        var ls = Travel.TravelTypes.Where(p => p.MaTravelType == tourtype).FirstOrDefault();
                        tours = (List<Tour>)tours.Where(c => c.TravelTypes.Contains(ls));
                    }
                    catch { }
                }

                if (part == "view-grid")
                {
                    return PartialView("_tourgrid", tours);
                }

                else
                {
                    return PartialView("_tourlist", tours);
                }

            }
        }

        // Detail Tour
        public ActionResult Tours_detail(int id)
        {
            Load_Page();
            ViewBag.Numstar = numstars[id];
            List<string> imgs = new List<string>();
            using (MyDbContext Travel = new MyDbContext())
            {
                var tour = Travel.Tours.Find(id);
                var Link = Travel.LinkImgs.Where(c => c.MaChiTietTour == tour.MaChiTietTour).ToList();
                foreach (var link in Link)
                {
                    imgs.Add(link.LinkImg1);
                }
                ViewBag.Imgs = imgs;
                return View(tour);

            }
        }

    }
}