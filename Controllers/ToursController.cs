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
            ViewBag.Numstar = numstars;
            List<string> imgs = new List<string>();
            using (MyDbContext Travel = new MyDbContext())
            {
                Tour tour = Travel.Tours.Find(id);
                List<LinkImg> Link = Travel.LinkImgs.Where(c => c.MaChiTietTour == tour.MaChiTietTour).ToList();
                List<DichVu> services = tour.DichVus.ToList();
                // service
                ViewBag.services = services;
                ChiTietTour chitiettour = Travel.ChiTietTours.Where(c => c.MaChiTietTour == tour.MaChiTietTour).FirstOrDefault();
                // chi tiet tour
                ViewBag.chitiettour = chitiettour;
                List<Ngay> ngays = Travel.Ngays.Where(c => c.MaChiTietTour == chitiettour.MaChiTietTour).OrderBy(c => c.MaNgay).ToList();
                //ngay
                ViewBag.ngays = ngays;
                List<ChiTietNgay> chitietngays = Travel.ChiTietNgays.Where(c => c.MaChiTietTour == chitiettour.MaChiTietTour).OrderBy(c => c.MaNgay).ToList();
                ViewBag.chitietngays = chitietngays;
                // review comment
                Dictionary<int, ChiTietTK> account_reviews = new Dictionary<int, ChiTietTK>();
                Dictionary<int, DanhGia> reviews = new Dictionary<int, DanhGia>();
                foreach (DanhGia dg in Travel.DanhGias.Where(c => c.MaTour == tour.MaTour).OrderBy(c => c.MaChiTietTK))
                {
                    reviews.Add(dg.MaChiTietTK, dg);
                    ChiTietTK tk = Travel.ChiTietTKs.Find(dg.MaChiTietTK);
                    account_reviews.Add(dg.MaChiTietTK, tk);
                }
                ViewBag.accounts = account_reviews;
                ViewBag.reviews = reviews;
                // TOur RELATED
                HashSet<Tour> tour_related = new HashSet<Tour>();
                foreach (DiaDanh dd in tour.DiaDanhs.ToList())
                {
                    var lis = dd.Tours.ToList();
                    lis.Remove(tour);
                    foreach (Tour t in lis)
                    {
                        tour_related.Add(t);
                    }
                }
                ViewBag.related = tour_related;
                // LINK IMG
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