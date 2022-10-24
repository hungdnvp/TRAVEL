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
        Dictionary<int, Nullable<int>> prices = new Dictionary<int, Nullable<int>>();
        Dictionary<int, Nullable<int>> numstars = new Dictionary<int, Nullable<int>>();
        public void Load_Page()
        {
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.ToList();
                foreach (Tour it in tours)
                {
                    Nullable<int> price = 999;
                    float star = 0f;
                    try
                    {
                        var bg = Travel.BangGias.FirstOrDefault(s => s.MaTour == it.MaTour);
                        if (bg != null)
                        {
                            price = bg.GiaNQ_NguoiLon;
                        }
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine("error get price");
                    }
                    this.prices.Add(it.MaTour, price);

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
            ViewBag.Prices = prices;
            ViewBag.Numstars = numstars;
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.ToList();
                return View(tours);
            }

        }

        // list -or- grid
        [HttpPost]
        public ActionResult AjaxView(int type)
        {
            Load_Page();
            ViewBag.Prices = prices;
            ViewBag.Numstars = numstars;
            using (MyDbContext Travel = new MyDbContext())
            {
                var tours = Travel.Tours.ToList();
                if (type == 2)
                {
                    return PartialView("_tourlist", tours);
                }
                else { return PartialView("_tourgrid", tours); }
            }
        }

        [HttpPost]
        public JsonResult AjaxSort(string type)
        {
            List<int> sort = new List<int>();
            using (MyDbContext Travel = new MyDbContext())
            {
                var bgs = Travel.BangGias.OrderBy(s => s.GiaNQ_NguoiLon).ToList();
                foreach (var bg in bgs)
                {
                    Tour t = Travel.Tours.FirstOrDefault(s => s.MaTour == bg.MaTour);
                    try
                    {
                        sort.Add((int)t.MaTour);
                    }
                    catch
                    {

                    }

                }
            }
            if (type == "inc")
            {
                string js = JsonConvert.SerializeObject(sort);
                return Json(js);
            }
            else
            {
                sort.Reverse();
                string js = JsonConvert.SerializeObject(sort);
                return Json(sort);
            }
        }
    }
}