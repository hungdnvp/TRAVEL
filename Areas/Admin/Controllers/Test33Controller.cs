using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Areas.Admin.Controllers
{
     public class Test33Controller : Controller
     {
          private MyDbContext db = new MyDbContext();

          // GET: Admin/Test33
          public ActionResult Index()
          {
               var blogs = db.Blogs.Include(b => b.TaiKhoan);
               return View(blogs.ToList());
          }

          // GET: Admin/Test33/Details/5
          public ActionResult Details(int? id)
          {
               if (id == null)
               {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
               }
               Blog blog = db.Blogs.Find(id);
               if (blog == null)
               {
                    return HttpNotFound();
               }
               return View(blog);
          }

          // GET: Admin/Test33/Create
          public ActionResult Create()
          {
               ViewBag.MaTaiKhoan = new SelectList(db.TaiKhoans, "MaTaiKhoan", "username");
               return View();
          }

          // POST: Admin/Test33/Create
          // To protect from overposting attacks, enable the specific properties you want to bind to, for 
          // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
          [HttpPost]
          [ValidateAntiForgeryToken]
          public ActionResult Create([Bind(Include = "Blog_ID,Ten,NoiDung,Link_Img,MaTaiKhoan,TacGia,MoTa,NgayDang,Tag,Category,Link_CoverImg")] Blog blog)
          {
               if (ModelState.IsValid)
               {
                    db.Blogs.Add(blog);
                    db.SaveChanges();
                    return RedirectToAction("Index");
               }

               ViewBag.MaTaiKhoan = new SelectList(db.TaiKhoans, "MaTaiKhoan", "username", blog.MaTaiKhoan);
               return View(blog);
          }

          // GET: Admin/Test33/Edit/5
          [ValidateInput(false)]
          public ActionResult Edit(int? id)
          {
               if (id == null)
               {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
               }
               Blog blog = db.Blogs.Find(id);
               if (blog == null)
               {
                    return HttpNotFound();
               }
               ViewBag.MaTaiKhoan = new SelectList(db.TaiKhoans, "MaTaiKhoan", "username", blog.MaTaiKhoan);
               return View(blog);
          }

          // POST: Admin/Test33/Edit/5
          // To protect from overposting attacks, enable the specific properties you want to bind to, for 
          // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
          [HttpPost]
          [ValidateAntiForgeryToken]
          public ActionResult Edit([Bind(Include = "Blog_ID,Ten,NoiDung,Link_Img,MaTaiKhoan,TacGia,MoTa,NgayDang,Tag,Category,Link_CoverImg")] Blog blog)
          {
               if (ModelState.IsValid)
               {
                    db.Entry(blog).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
               }
               ViewBag.MaTaiKhoan = new SelectList(db.TaiKhoans, "MaTaiKhoan", "username", blog.MaTaiKhoan);
               return View(blog);
          }

          // GET: Admin/Test33/Delete/5
          public ActionResult Delete(int? id)
          {
               if (id == null)
               {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
               }
               Blog blog = db.Blogs.Find(id);
               if (blog == null)
               {
                    return HttpNotFound();
               }
               return View(blog);
          }

          // POST: Admin/Test33/Delete/5
          [HttpPost, ActionName("Delete")]
          [ValidateAntiForgeryToken]
          public ActionResult DeleteConfirmed(int id)
          {
               Blog blog = db.Blogs.Find(id);
               db.Blogs.Remove(blog);
               db.SaveChanges();
               return RedirectToAction("Index");
          }

          protected override void Dispose(bool disposing)
          {
               if (disposing)
               {
                    db.Dispose();
               }
               base.Dispose(disposing);
          }
     }
}
