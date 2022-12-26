using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Controllers
{
     public class KhongPhuongThaoController : Controller
     {
          // GET: KhongPhuongThao
          public ActionResult Index()
          {
               return View();
          }
          // Them Entity: Add
          public void AddBlog()
          {
               var travel = new MyDbContext();
               var newBlog = new Blog();
               newBlog.Blog_ID = 22;
               newBlog.MaTaiKhoan = 2;
               newBlog.MoTa = "Test add new blog";
               travel.Blogs.Add(newBlog);
               travel.SaveChanges();
          }
          //The entity danh dau trang thai
          public void AddBlog_state()
          {
               var travel = new MyDbContext();
               var newBlog = new Blog();
               newBlog.Blog_ID = 22;
               newBlog.MaTaiKhoan = 2;
               newBlog.MoTa = "Test add new blog";
               travel.Entry(newBlog).State = System.Data.Entity.EntityState.Added;
               travel.SaveChanges();
          }
          // update info

          public void update(int idBlog)
          {
               Blog blg;
               var travel = new MyDbContext();

               blg = travel.Blogs.Where(b => (b.Blog_ID == idBlog)).FirstOrDefault();

               if (blg != null)
               {
                    blg.Tag = "Theme;Event";
               }
               travel.Entry(blg).State = System.Data.Entity.EntityState.Modified;
               travel.SaveChanges();
          }
          // su dung SQLquery

          public List<Blog> GetDS(int id, String name)
          {
               var travel = new MyDbContext();

               SqlParameter[] idParam =
               {
                    new SqlParameter {ParameterName = "id", Value = id},
                    new SqlParameter{ ParameterName = "name", Value = name} };
               // GetBlog: procedure trong SQL
               var list_get = travel.Blogs.SqlQuery("GetBlog @id, @name", idParam).ToList<Blog>();
               return list_get;
          }

     }
}