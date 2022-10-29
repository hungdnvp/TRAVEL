using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;
using PagedList;

namespace TRAVEL.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index(int ? page, string sortby="",string sort_type="",string name="", string author="", string category = "", string tag="" )
        {
            MyDbContext md = new MyDbContext();
            var model = md.Blogs.ToList();

               switch (sortby)
               {
                    case "name":
                         if (sort_type == "ascend")
                         {
                              model = model.OrderBy(x => x.Ten).ToList();
                         }
                         else if (sort_type == "descend")
                         {
                              model = model.OrderByDescending(x => x.Ten).ToList();
                         }

                         break;
                    case "post_date":
                         if (sort_type == "ascend")
                         {
                              model = model.OrderBy(x => x.NgayDang).ToList();
                         }
                         else if (sort_type == "descend")
                         {
                              model = model.OrderByDescending(x => x.NgayDang).ToList();
                         }
                         break;

                    //case "comments":

                    //     if (sort_type == "ascend")
                    //     {

                    //     }
                    //     else if (sort_type == "descend")
                    //     {

                    //     }
                    //     else
                    //     {

                    //     }
                    //     break;

                    //case "reactions":

                    //     if (sort_type == "ascend")
                    //     {

                    //     }
                    //     else if (sort_type == "descend")
                    //     {

                    //     }
                    //     else
                    //     {

                    //     }
                    //     break;

                    default:
                         break;
               }
               model = searchModelByName(searchModelByAuthor(searchModelByCategory(searchModelByTag(model, tag), category), author), name);
               int pageSize = 6;
               int no_of_page = (page ?? 1);
               return View(model.ToPagedList(no_of_page, pageSize));
        }
          public ActionResult Blog_sidebar(int ? page)
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               return View(model.ToPagedList(no_of_page, pageSize));
          }
          public ActionResult Blog_detail(int id)
          {
               var md = new MyDbContext();
               var Blog_dt_model = md.Blogs.Single(b => b.Blog_ID== id);
               return View(Blog_dt_model);
          }
          public List<Blog> searchModelByName(List<Blog> model, string name)
          {
               if (name != null)
               {
                    model = model.Where(x => (x.Ten.ToUpper().Contains(name.ToUpper()))).ToList();
               }
               else
               {
                    model = model.ToList();
               }
               return model;
          }
          public List<Blog> searchModelByAuthor(List<Blog> model, string author)
          {
               if (author != null)
               {
                    model = model.Where(x => (x.Ten.ToUpper().Contains(author.ToUpper()))).ToList();
               }
               else
               {
                    model = model.ToList();
               }
               return model;
          }
          public List<Blog> searchModelByTag(List<Blog> model, string tag)
          {
               if (tag != null)
               {
                    model = model.Where(x => (x.Ten.ToUpper().Contains(tag.ToUpper()))).ToList();
               }
               else
               {
                    model = model.ToList();
               }
               return model;
          }
          public List<Blog> searchModelByCategory(List<Blog> model, string category)
          {
               if (category != null)
               {
                    model = model.Where(x => (x.Ten.ToUpper().Contains(category.ToUpper()))).ToList();
               }
               else
               {
                    model = model.ToList();
               }
               return model;
          }

     }
}