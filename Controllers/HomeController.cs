﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {

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

        //[ValidateAntiForgeryToken]
        public ActionResult Register(TaiKhoan tk)
        {
            if (ModelState.IsValid)
            {
                using (MyDbContext Travel = new MyDbContext())
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
                        return RedirectToAction("View");
                    }
                }
            }
            return RedirectToAction("View");
        }

        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

          //POST: Login

        [HttpPost]

        //[ValidateAntiForgeryToken]
        public ActionResult Login(TaiKhoan tk, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                using (MyDbContext Travel = new MyDbContext())
                {
                    var f_password = GetMD5(tk.pass);
                    List<TaiKhoan> data = Travel.TaiKhoans.Where(s => s.username.Equals(tk.username) && s.pass.Equals(f_password)).ToList();
                    if (data.Count() > 0)
                    {
                        //add session
                        TaiKhoan login = data.FirstOrDefault();
                        Session["username"] = login.username;
                        Session["role"] = login.role;
                        Session["online"] = login;
                        FormsAuthentication.SetAuthCookie(login.username, false);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ViewBag.error = "Login failed";
                        return RedirectToAction("Login");
                    }
                }
            }
            return View();
        }
        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();//remove session
            return RedirectToAction("Index", "Home");
        }

        // forgot

        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]

        //[ValidateAntiForgeryToken]
        public JsonResult ForgotPassword(string email)
        {
            using (MyDbContext Travel = new MyDbContext())
            {
                var check = Travel.TaiKhoans.Where(c => c.email == email).FirstOrDefault();
                if (check != null)
                {
                    SendMailService mailservice = new SendMailService();
                    mailservice.setTo(email);
                    _ = mailservice.SendMail();
                    return Json(mailservice.code);
                }
                else
                {
                    return Json("Invalid Email");
                }
            }


        }

        [HttpPost]
        [Authorize]
        public ActionResult NewPass(string email, string pass)
        {
            using (MyDbContext Travel = new MyDbContext())
            {
                TaiKhoan tk = Travel.TaiKhoans.Where(c => c.email == email).FirstOrDefault();
                if (tk != null)
                {
                    tk.pass = GetMD5(pass);
                    Travel.Configuration.ValidateOnSaveEnabled = false;
                    Travel.SaveChanges();
                    return RedirectToAction("Login");
                }
            }
            return View("ForgotPassword");
        }

     }
}