using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;

using PagedList;


namespace TRAVEL.Controllers
{
    public class DestinationsController : Controller
    {

        // GET: Destinations

        public ActionResult Destination_mansory(int? page, string search = "", int? mavung = 0)

        {
            MyDbContext mdt = new MyDbContext();
            var model = mdt.DiaDanhs.Include("Vung").ToList();

            if (mavung == 0 && search != "")
            {
                model = model.Where(x => x.TenDiaDanh.Contains(search) || x.Vung.TenVung.Contains(search)).ToList();
            }
            if (mavung != 0 && search == "")
            {
                model = model.Where(x => x.MaVung == mavung).ToList();
            }
            if (mavung != 0 && search != "")
            {
                model = model.Where(x => ((x.TenDiaDanh.Contains(search) || x.Vung.TenVung.Contains(search)) && x.MaVung == mavung)).ToList();
            }

            // nếu page == null thì đặt lại là 1
            if (page == null) page = 1;
            // tạo kích thước trang(pageSize) 
            int pageSize = 9;
            //nếu page = null thì lấy giá trị 1 cho biến page Number
            int pageNumber = (page ?? 1);

            // tạo truy vấn, lưu ý phải sắp xếp theo trường nào đó
            // Tạo LinkID mới có thể phân trang
            var links = model.ToPagedList(pageNumber, pageSize);



            return View(model.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Destination_Detail(int id)
        {
            using (MyDbContext mdt = new MyDbContext())
            {
                var model = mdt.DiaDanhs.Include("Tours").Where(x => x.MaDiaDanh == id).FirstOrDefault();
                ViewBag.Tour = model.Tours.ToArray();
                return View(model);
            }

        }
    }
}