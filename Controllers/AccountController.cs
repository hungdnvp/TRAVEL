using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using TRAVEL.Models;
using System.Diagnostics;

namespace TRAVEL.Controllers
{
    [CustomAuthorize]
    public class AccountController : Controller
    {

        public ActionResult Index()
        {
            return View();
        }

        // GET: Account
        public ActionResult Profile()
        {
            using(MyDbContext db = new MyDbContext())
            {
                TaiKhoan account = new TaiKhoan();
                account = (TaiKhoan)Session["online"];
                ChiTietTK account_cttk = new ChiTietTK();
                account_cttk = db.ChiTietTKs.Where(c => c.MaTaiKhoan == account.MaTaiKhoan).FirstOrDefault();
                ViewBag.account_cttk = account_cttk;
                return View(account);
            }
            
        }
    }
}