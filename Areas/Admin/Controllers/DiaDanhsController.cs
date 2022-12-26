using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

namespace TRAVEL.Areas.Admin.Controllers
{
    [CustomAuthorize(Role = "admin")]
    public class DiaDanhsController : Controller
    {
        private MyDbContext db = new MyDbContext();

        // GET: Admin/DiaDanhs
        public ActionResult Index()
        {
            var diaDanhs = db.DiaDanhs.Include(d => d.Vung);
            return View(diaDanhs.ToList());
        }

        // GET: Admin/DiaDanhs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiaDanh diaDanh = db.DiaDanhs.Find(id);
            if (diaDanh == null)
            {
                return HttpNotFound();
            }
            return View(diaDanh);
        }

        //GET: Admin/DiaDanhs/Create
        public ActionResult Create()
        {
            ViewBag.MaVung = new SelectList(db.Vungs, "MaVung", "TenVung");
            return View(new DiaDanh());
        }


        [HttpPost]
        public ActionResult Create(DiaDanh diaDanh)
        {
            if (ModelState.IsValid)
            {
                db.DiaDanhs.Add(diaDanh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaVung = new SelectList(db.Vungs, "MaVung", "TenVung", diaDanh.MaVung);
            return View(diaDanh);
        }

        // GET: Admin/DiaDanhs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiaDanh diaDanh = db.DiaDanhs.Find(id);
            if (diaDanh == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaVung = new SelectList(db.Vungs, "MaVung", "TenVung", diaDanh.MaVung);
            return View(diaDanh);
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDiaDanh,TenDiaDanh,Img,MoTa,MaVung")] DiaDanh diaDanh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(diaDanh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaVung = new SelectList(db.Vungs, "MaVung", "TenVung", diaDanh.MaVung);
            return View(diaDanh);
        }

        // GET: Admin/DiaDanhs/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    DiaDanh diaDanh = db.DiaDanhs.Find(id);
        //    if (diaDanh == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return RedirectToAction("Index"); ;
        //}

        // POST: Admin/DiaDanhs/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            DiaDanh diaDanh = db.DiaDanhs.Find(id);
            db.DiaDanhs.Remove(diaDanh);
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
