using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;
using Newtonsoft;

namespace TRAVEL.Controllers
{
    public class ToursController : Controller
    {
        // GET: Tours
        Dictionary<int, Nullable<int>> prices = new Dictionary<int, Nullable<int>>();
        Dictionary<int, Nullable<int>> numstars = new Dictionary<int, Nullable<int>>();
        public ActionResult Tours_grid()
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

                ViewBag.Prices = prices;
                ViewBag.Numstars = numstars;
                return View(tours);

            }

        }

        [HttpPost]
        public ActionResult AjaxView(int type)
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

                ViewBag.Prices = prices;
                ViewBag.Numstars = numstars;
                if (type == 2)
                {
                    return PartialView("_tourlist", tours);
                }
                else { return PartialView("_tourgrid", tours); }
            }
        }
    }
}