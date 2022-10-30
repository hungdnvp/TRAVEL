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
          public ActionResult Index(int? page)
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);
               return View(model.ToPagedList(no_of_page, pageSize));
          }
          //[HttpPost]
          public ActionResult ajaxSortIndex(int? page, int? sortby, int? sort_type)
          {

               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               ViewBag.sort_type = sort_type;
               switch (sortby)
               {
                    case 1:
                         if (sort_type == 2)
                         {
                              model = model.OrderBy(x => x.Ten).ToList();
                         }
                         else if (sort_type == 3)
                         {
                              model = model.OrderByDescending(x => x.Ten).ToList();
                         }

                         break;
                    case 2:
                         if (sort_type == 6)
                         {
                              model = model.OrderBy(x => x.NgayDang).ToList();
                         }
                         else if (sort_type == 7)
                         {
                              model = model.OrderByDescending(x => x.NgayDang).ToList();
                         }
                         break;

                    //case "num_of_comments":

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

                    //case "num_of_reactions":

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
                    //case "all":

                    //     break;

                    default:
                         break;
               }
               //model = searchModelByName(searchModelByAuthor(searchModelByCategory(searchModelByTag(model, tag), category), author), name);
               int pageSize = 6;
               //int no_of_page = 1;
               int no_of_page = (page ?? 1);

               return PartialView("_index", model.ToPagedList(no_of_page, pageSize));
          }

          public ActionResult Blog_sidebar(int? page)
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               return View("Blog_sidebar", model.ToPagedList(no_of_page, pageSize));
          }

          public ActionResult ajax_Sort_Search_sidebar(int? page, int? sortby, int? sort_type, string name = "", string author = "", string category = "", string tag = "")
          {

               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               ViewBag.sort_type = sort_type;
               switch (sortby)
               {
                    case 1:
                         if (sort_type == 2)
                         {
                              model = model.OrderBy(x => x.Ten).ToList();
                         }
                         else if (sort_type == 3)
                         {
                              model = model.OrderByDescending(x => x.Ten).ToList();
                         }

                         break;
                    case 2:
                         if (sort_type == 6)
                         {
                              model = model.OrderBy(x => x.NgayDang).ToList();
                         }
                         else if (sort_type == 7)
                         {
                              model = model.OrderByDescending(x => x.NgayDang).ToList();
                         }
                         break;

                    //case "num_of_comments":

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

                    //case "num_of_reactions":

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
                    //case "all":

                    //     break;

                    default:
                         break;
               }
               ViewBag.name = name;
               ViewBag.tag = tag;
               ViewBag.author = author;
               ViewBag.category = category;

               model = searchModelByName(searchModelByAuthor(searchModelByCategory(searchModelByTag(model, tag), category), author), name);
               int pageSize = 6;
               //int no_of_page = 1;
               int no_of_page = (page ?? 1);
               ViewBag.test = 2;
               return PartialView("_blogsidebar", model.ToPagedList(no_of_page, pageSize));
          }



          public ActionResult Blog_detail(int id)
          {
               var md = new MyDbContext();
               var Blog_dt_model = md.Blogs.Single(b => b.Blog_ID == id);
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