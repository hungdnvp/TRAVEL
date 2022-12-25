using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TRAVEL.Models;
using PagedList;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Windows.Forms;

namespace TRAVEL.Controllers
{
     [AllowAnonymous]
     public class BlogController : Controller
     {
          // GET: Blog
          public ActionResult Index(int? page)
          {
               //ViewBag.tagList = GetAllTags();
               //ViewBag.categoryDict = GetAllCategories();
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               // process recent Blog
               //ViewBag.recentViewedBlog = Session["recentlyViewedBlog"] as List<RecentBlog>;
               //var listRecentPosted = recentPostedBlog(5);
               //ViewBag.recentPostedBlog = listRecentPosted;

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

          public ActionResult Blog_sidebar(int? page, string searchBy="", string searchString = "")
          {
               ViewBag.tagList = GetAllTags();
               ViewBag.categoryDict = GetAllCategories();
               // process recent Blog
               ViewBag.recentViewedBlog = Session["recentlyViewedBlog"] as List<RecentBlog>;
               var listRecentPosted = recentPostedBlog(5);
               ViewBag.recentPostedBlog = listRecentPosted;
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               if (searchBy == "name")
               {
                    model = md.Blogs.Where(b => (b.Ten.ToLower().Contains(searchString.ToLower()))).ToList();
               }
               else if (searchBy == "author")
               {
                    model = md.Blogs.Where(b => (b.TacGia.ToLower().Contains(searchString.ToLower()))).ToList();
               }
               else if (searchBy == "tag")
               {
                    model = md.Blogs.Where(b => (b.Tag.ToLower().Contains(searchString.ToLower()))).ToList();
               }
               else if (searchBy == "category")
               {
                    model = md.Blogs.Where(b => (b.Category.ToLower().Contains(searchString.ToLower()))).ToList();
               }
               //else
               //{
               //     model = md.Blogs.Where(b => (b.Ten.ToLower().Contains(searchString.ToLower()))).ToList();
               //}
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               return View("Blog_sidebar", model.ToPagedList(no_of_page, pageSize));
          }

          public ActionResult ajax_Sort_Search_sidebar(int? page, int? sortby, int? sort_type)
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
               //ViewBag.name = name;
               //ViewBag.tag = tag;
               //ViewBag.author = author;
               //ViewBag.category = category;

               //model = searchModelByName(searchModelByAuthor(searchModelByCategory(searchModelByTag(model, tag), category), author), name);
               int pageSize = 6;
               //int no_of_page = 1;
               int no_of_page = (page ?? 1);
               ViewBag.test = 2;
               return PartialView("_blogsidebar", model.ToPagedList(no_of_page, pageSize));
          }


          public void AddRecentlyViewedBlog(List<RecentBlog> list, int blogId, string ten, string author, string image, DateTime ngaydang, int maxNum)
          {
               var item = new RecentBlog();
               try
               {
                    //item = list.FirstOrDefault(b => b.blogId == blogId);
                    if (list.FirstOrDefault(b => b.blogId == blogId) == null)
                    {
                         // danh sach trong, them vao dau danh sach
                         list.Add(new RecentBlog
                         {
                              blogId = blogId,
                              ten = ten,
                              author = author,
                              image = image,
                              ngaydang = ngaydang,
                              lastVisited = DateTime.UtcNow,
                         });
                    }
                    else
                    {
                         List<RecentBlog> temp = new List<RecentBlog>();
                         temp.Add(new RecentBlog
                         {
                              blogId = blogId,
                              ten = ten,
                              author = author,
                              image = image,
                              ngaydang = ngaydang,
                              lastVisited = DateTime.UtcNow,
                         });
                         list.AddRange(temp);
                         // Them blog vao cuoi danh sach
                    }
               }
               catch (Exception e)
               {
                    //// danh sach trong, them vao dau danh sach
                    //list = new List<RecentBlog>();
                    //list.Add(new RecentBlog
                    //{
                    //     blogId = blogId,
                    //     ten = ten,
                    //     author = author,
                    //     image = image,
                    //     ngaydang = ngaydang,
                    //     lastVisited = DateTime.UtcNow,
                    //});
               }
               while (list.Count > maxNum)
               {
                    list.RemoveAt(0);
                    //first in first out
               }

          }
          public List<Blog> recentPostedBlog(int maxNUm)
          {
               // sort datetime descending (newest - oldest)
               var md = new MyDbContext();
               var model = md.Blogs.ToList();
               model.OrderByDescending(x => x.NgayDang).ToList();
               var listRes = new List<Blog>();
               for (int i = 0; i < maxNUm; i++)
               {
                    listRes.Add(model[i]);
               }
               return listRes;
          }
          // Add recent blog: 
          // neu dang nhap: Add recently viewed blog: viewbag => list dung trong index, blog_detail, blog_sidebar controller 
          // neu chua dang nhap, hien thi cac bai duoc dang gan nhat

          public ActionResult Blog_detail(int id)
          {

               var md = new MyDbContext();
               var Blog_dt_model = md.Blogs.Where(b => b.Blog_ID == id).Include(b => b.BlogComments).FirstOrDefault();
               //var session = (SessionInfo)Session["info"];
               //ViewBag.session = session;
               if (Blog_dt_model == null)
               {
                    return HttpNotFound();
               }
               var list = new List<RecentBlog>();
               // read list of recent blog from session
               if (Session["mataikhoan"] != null)
               {

                    list = Session["recentlyViewedBlog"] as List<RecentBlog>;
                    if (list == null)
                    {
                         list = new List<RecentBlog>();
                    }
                    AddRecentlyViewedBlog(list, id, Blog_dt_model.Ten, Blog_dt_model.TacGia, Blog_dt_model.Link_Img, (DateTime)Blog_dt_model.NgayDang, 6);
                    Session["recentlyViewedBlog"] = list;
                    ViewBag.recentViewedBlog = list;
               }
               else
               {
                    var listRecentPosted = recentPostedBlog(5);
                    ViewBag.recentPostedBlog = listRecentPosted;

               }


               ViewBag.categoryDict = GetAllCategories();
               ViewBag.tagList = GetAllTags();
               return View(Blog_dt_model);
          }

          //public ActionResult searchBlog(int? page, string searchBy = "", string searchString = "")
          //{
          //     //string searchBy = ViewBag.searchBy;
          //     var md = new MyDbContext();
          //     var model = new List<Blog>();
          //     if (searchBy == "name")
          //     {
          //          model = md.Blogs.Where(b => (b.Ten.ToLower().Contains(searchString.ToLower()))).ToList();
          //     }
          //     else if (searchBy == "author")
          //     {
          //          model = md.Blogs.Where(b => (b.TacGia.ToLower().Contains(searchString.ToLower()))).ToList();
          //     }
          //     else if (searchBy == "tag")
          //     {
          //          model = md.Blogs.Where(b => (b.Tag.ToLower().Contains(searchString.ToLower()))).ToList();
          //     }
          //     else if (searchBy == "category")
          //     {
          //          model = md.Blogs.Where(b => (b.Category.ToLower().Contains(searchString.ToLower()))).ToList();
          //     }
          //     else
          //     {
          //          model = md.Blogs.Where(b => (b.Ten.ToLower().Contains(searchString.ToLower()))).ToList();
          //     }
          //     int pageSize = 6;
          //     int no_of_page = (page ?? 1);
          //     return View("searchBlog", model.ToPagedList(no_of_page, pageSize));
          //     //return PartialView("_searchBlog", model.ToPagedList(no_of_page, pageSize));
          //}
          //public List<Blog> searchModelByAuthor(List<Blog> model, string author)
          //{
          //     if (author != null)
          //     {
          //          model = model.Where(x => (x.TacGia.ToUpper().Contains(author.ToUpper()))).ToList();
          //     }
          //     else
          //     {
          //          model = model.ToList();
          //     }
          //     return model;
          //}
          //public List<Blog> searchModelByTag(List<Blog> model, string tag)
          //{
          //     if (tag != null)
          //     {
          //          model = model.Where(x => (x.Tag.ToUpper().Contains(tag.ToUpper()))).ToList();
          //     }
          //     else
          //     {
          //          model = model.ToList();
          //     }
          //     return model;
          //}
          //public List<Blog> searchModelByCategory(List<Blog> model, string category)
          //{
          //     if (category != null)
          //     {
          //          model = model.Where(x => (x.Category.ToUpper().Contains(category.ToUpper()))).ToList();
          //     }
          //     else
          //     {
          //          model = model.ToList();
          //     }
          //     return model;
          //}

          public ActionResult GetAllComments(int? BlogID)
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.Where(c => c.Blog_ID == BlogID).FirstOrDefault();
               ViewBag.model = model;
               return PartialView("_getAllComments", model);
          }

          public ActionResult AddComments(int blogId, String comment = "", string returnUrl = "")
          {
               var md = new MyDbContext();
               var taikhoan = new TaiKhoan();
               var taikhoanID = new int();
               var blog = md.Blogs.FirstOrDefault(b => b.Blog_ID == blogId);
               if (Session["mataikhoan"] != null)
               {
                    taikhoanID = (int)Session["mataikhoan"];
                    taikhoan = md.TaiKhoans.FirstOrDefault(t => t.MaTaiKhoan == taikhoanID);

                    //if (comment == "")
                    //{
                    //     //MessageBox.Show("Please enter your comment before submitting", "Empty Comment", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //}
                    //else
                    //{
                    //     var blogCmt = new BlogComment();
                    //     blogCmt.MaTaiKhoan = taikhoanID;
                    //     blogCmt.NoiDung = comment;
                    //     blogCmt.NgayGio = DateTime.UtcNow;
                    //     blog.BlogComments.Add(blogCmt);
                    //     md.SaveChanges();
                    //}
                    if (comment != "")
                    {
                         var blogCmt = new BlogComment();
                         blogCmt.MaTaiKhoan = taikhoanID;
                         blogCmt.NoiDung = comment;
                         blogCmt.NgayGio = DateTime.UtcNow;
                         blog.BlogComments.Add(blogCmt);
                         md.SaveChanges();
                    }
               }
               else
               {
                    return RedirectToAction("Login", "Home", new { returnUrl = returnUrl });
               }
               return RedirectToAction("Blog_detail", "Blog", new { id = blogId });
          }

          public List<String> GetAllTags()
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               List<String> tagList = new List<string>();
               foreach (Blog blog in model)
               {
                    if (blog.Tag.Contains(";"))
                    {
                         var temp = blog.Tag.Split(';');
                         foreach (string tg in temp)
                         {
                              if (!tagList.Contains(tg))
                              {
                                   tagList.Add(tg);
                              }

                         }
                    }
                    else
                    {
                         if (!tagList.Contains(blog.Tag))
                         {
                              tagList.Add(blog.Tag);
                         }
                    }
               }

               return tagList;
          }
          public ActionResult TagFilter(int? page, string tag)
          {
               ViewBag.tagList = GetAllTags();
               ViewBag.categoryDict = GetAllCategories();
               // process recent Blog
               ViewBag.recentViewedBlog = Session["recentlyViewedBlog"] as List<RecentBlog>;
               var listRecentPosted = recentPostedBlog(5);
               ViewBag.recentPostedBlog = listRecentPosted;
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.Where(b => (b.Tag.ToUpper().Contains(tag.ToUpper()))).ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               return View("Blog_sidebar", model.ToPagedList(no_of_page, pageSize));
          }

          public Dictionary<String, int> GetAllCategories()
          {
               MyDbContext md = new MyDbContext();
               var model = md.Blogs.ToList();
               Dictionary<String, int> categoryDict = new Dictionary<string, int>();
               foreach (Blog blog in model)
               {
                    if (!categoryDict.ContainsKey(blog.Category))
                    {
                         categoryDict.Add(blog.Category, md.Blogs.Count(b => (b.Category.ToLower() == blog.Category.ToLower())));
                    }
               }

               return categoryDict;
          }
          public ActionResult CategoryFilter(int? page, string category)
          {
               ViewBag.tagList = GetAllTags();
               ViewBag.categoryDict = GetAllCategories();
               // process recent Blog
               ViewBag.recentViewedBlog = Session["recentlyViewedBlog"] as List<RecentBlog>;
               var listRecentPosted = recentPostedBlog(5);
               ViewBag.recentPostedBlog = listRecentPosted;

               MyDbContext md = new MyDbContext();
               var model = md.Blogs.Where(b => (b.Category.ToUpper().Contains(category.ToUpper()))).ToList();
               int pageSize = 6;
               int no_of_page = (page ?? 1);

               return View("Blog_sidebar", model.ToPagedList(no_of_page, pageSize));
          }

     }
}