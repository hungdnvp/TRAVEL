using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace TRAVEL.Controllers
{
     [AllowAnonymous]
    public class CaptchaController : Controller
    {
        // GET: Captcha
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult FromSubmit()
          {
               //Validate Google recaptcha below

               var response = Request["g-recaptcha-response"];
               string secretKey = "6Lccj3wiAAAAAKEYH3ompvUb5ugerhOVtVOcis-Y";
               var client = new WebClient();
               ViewData["Message"] = "Google reCaptcha validation success";
               return RedirectToAction("Login", "Home");
          }

    }

}