using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Areas.Admin.Controllers
{
    [CustomAuthorize(Role = "admin")]
    public class ManagerController : Controller
    {
        // GET: Admin/Manager
        public ActionResult DashBoard()
        {
            return View();
        }
    }
}