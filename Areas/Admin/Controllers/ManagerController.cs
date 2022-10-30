using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TRAVEL.Areas.Admin.Controllers
{
    public class ManagerController : Controller
    {
        // GET: Admin/Manager
        public ActionResult DashBoard()
        {
            return View();
        }
    }
}