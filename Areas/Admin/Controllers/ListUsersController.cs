using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Areas.Admin.Controllers
{
    [CustomAuthorize(Role = "admin")]
    public class ListUsersController : Controller
    {
        // GET: Admin/ListUsers
        public ActionResult ListUsers()
        {
            return View();
        }
    }
}