using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace TRAVEL.Models
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public string Role { get; set; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            TaiKhoan taiKhoan = (TaiKhoan)HttpContext.Current.Session["online"];
            if (taiKhoan != null)
            {
                if (Role == null) return true;
                else if (taiKhoan.role == Role)
                {
                    return true;
                }
            }

            return false;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult()
            {
                ViewName = "~/Views/Home/Permission.cshtml"
            };
        }
    }
}