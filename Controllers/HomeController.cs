using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
    public class HomeController : Controller
    {
        private MyDbContext Travel = new MyDbContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Register()
        {

            return View();
        }

        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(TaiKhoan tk)
        {
            if (ModelState.IsValid)
            {
                var check1 = Travel.TaiKhoans.FirstOrDefault(s => s.email == tk.email);
                var check2 = Travel.TaiKhoans.FirstOrDefault(s => s.username == tk.username);
                if (check1 == null && check2 == null)
                {
                    tk.pass = GetMD5(tk.pass);
                    tk.role = "user";
                    Travel.Configuration.ValidateOnSaveEnabled = false;
                    Travel.TaiKhoans.Add(tk);
                    Travel.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.error = "Email or username already exists";
                    return View();
                }
            }
            return View();
        }

        public ActionResult Login()
        {

            return View();
        }

        //POST: Login

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(TaiKhoan tk)
        {
            if (ModelState.IsValid)
            {
                var f_password = GetMD5(tk.pass);
                var data = Travel.TaiKhoans.Where(s => s.username.Equals(tk.username) && s.pass.Equals(f_password)).ToList();
                if (data.Count() > 0)
                {
                    //add session
                    Session["username"] = data.FirstOrDefault().username;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }
    }
}