using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TRAVEL.Areas.Admin.Controllers
{
    public class ListUsersController : Controller
    {
        // GET: Admin/ListUsers
        public ActionResult ListUsers()
        {
            return View();
        }
    }
}