using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Areas.Admin.Controllers
{
     public class AdminBlogController : Controller
     {
          [CustomAuthorize(Role = "admin")]
          // GET: Admin/AdminBlog/ListBlogs
          public ActionResult ListBlogs()
          {
               MyDbContext Travel = new MyDbContext();

               List<Blog> list = new List<Blog>();


               list = Travel.Blogs.ToList();

               return View(list);

          }
          public ActionResult CategoryFilter(string category = "")
          {
               MyDbContext Travel = new MyDbContext();

               List<Blog> list = new List<Blog>();
               category = Request["category"];
               list = Travel.Blogs.Where(b => (b.Category.ToUpper().Contains(category.ToUpper()))).ToList();
               //return PartialView("_listBlog", list);
               return View(list);

          }

          // GET: /Admin/AdminBlog/Edit?idBlog = 1
          public ActionResult Edit(int idBlog)
          {
               if (idBlog == null)
               {
                    return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
               }
               MyDbContext Travel = new MyDbContext();
               Blog blog = Travel.Blogs.Find(idBlog);
               if (blog == null)
               {
                    return HttpNotFound();
               }
               return View(blog);
          }

          [HttpPost]
          [ValidateAntiForgeryToken]
          public ActionResult Edit([Bind(Include = "")] Blog blg)
          {
               MyDbContext db = new MyDbContext();
               if (ModelState.IsValid)
               {
                    db.Entry(blg).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
               }

               return View(blg);
          }

          // GET: /Admin/AdminBlog/Delete?idBlog = 1
          public ActionResult Delete(int idBlog)
          {
               Boolean deleted = false;
               MyDbContext Travel = new MyDbContext();

               Blog b = Travel.Blogs.Find(idBlog);
               if (b != null)
               {
                    b.BlogComments.Clear();
                    Travel.Blogs.Remove(b);
                    Travel.SaveChanges();
                    deleted = true;
                    ViewBag.deleted = deleted;
               }

               return RedirectToAction("ListBlogs");
          }
          public ActionResult Create()
          {
               return View();
          }
     }
}


