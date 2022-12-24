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

        [HttpPost]
        public ActionResult Upload(string email,string phoneNumber,string address,string fullName,HttpPostedFileBase image)
        {
            using (MyDbContext db = new MyDbContext())
            {
                Image img = new Image();
                TaiKhoan account = new TaiKhoan();
                account = (TaiKhoan)Session["online"];
                ChiTietTK account_cttk = new ChiTietTK();
                account_cttk = db.ChiTietTKs.Where(c => c.MaTaiKhoan == account.MaTaiKhoan).FirstOrDefault();
                if (image !=null && image.ContentLength > 0)
                {
                    img.image = new byte[image.ContentLength];
                    image.InputStream.Read(img.image, 0, image.ContentLength);
                    string fileName = System.IO.Path.GetFileName(image.FileName);
                    string urlImage = Server.MapPath("~/assets/img/avatar/" + fileName);
                    image.SaveAs(urlImage);

                    account_cttk.LinkAvatar = "img/avatar/" + fileName;
                }
                if (!String.IsNullOrEmpty(email))
                {
                    account.email = email;
                }
                if (!String.IsNullOrEmpty(phoneNumber)) account_cttk.SDT = phoneNumber;
                if (!String.IsNullOrEmpty(address)) account_cttk.DiaChi = address;

                db.SaveChanges();
            }

            
            return RedirectToAction("Profile");
        }
    }
}