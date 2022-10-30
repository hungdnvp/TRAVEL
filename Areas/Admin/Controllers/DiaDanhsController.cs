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

        // GET: Admin/DiaDanhs/Create
        public ActionResult Create()
        {
            ViewBag.MaVung = new SelectList(db.Vungs, "MaVung", "TenVung");
            return View();
        }

        // POST: Admin/DiaDanhs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDiaDanh,TenDiaDanh,Img,MoTa,MaVung")] DiaDanh diaDanh)
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

        // POST: Admin/DiaDanhs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
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
        public ActionResult Delete(int? id)
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

        // POST: Admin/DiaDanhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
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
