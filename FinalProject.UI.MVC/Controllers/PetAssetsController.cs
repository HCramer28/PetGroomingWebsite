using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA.EF;
using Microsoft.AspNet.Identity;


namespace FinalProject.UI.MVC.Controllers
{
    
    public class PetAssetsController : Controller
    {
        private PetGroomingEntities db = new PetGroomingEntities();

        // GET: PetAssets
        public ActionResult Index()
        {
            var petAssets = db.PetAssets.Include(p => p.UserDetail).Where(pa => pa.OwnerId == pa.OwnerId);

            //use linq 
            return View(petAssets.ToList());
        }

        // GET: PetAssets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PetAsset petAsset = db.PetAssets.Find(id);
            if (petAsset == null)
            {
                return HttpNotFound();
            }
            return View(petAsset);
        }

        // GET: PetAssets/Create
        public ActionResult Create()
        {
            ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FullName");
            return View();
        }

        // POST: PetAssets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PetAssetId,PetName,OwnerId,PetPhoto,Notes,IsActive,DateAdded")] PetAsset petAsset, HttpPostedFileBase petimage)
        {
            if (ModelState.IsValid)
            {
                string imagename = "noimage.png";
                if (petimage != null)
                {
                    imagename = petimage.FileName;
                    string ext = imagename.Substring
                        (imagename.LastIndexOf("."));
                    string[] goodExts = { ".jpg", ".jpeg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()))
                    {                      
                        petimage.SaveAs(Server.MapPath("~/Content/img/PetAssetsPics/" + imagename));

                    }
                    else
                    {
                        imagename = "noimage.png";
                    }
                }
                petAsset.PetPhoto = imagename;
                petAsset.OwnerId = User.Identity.GetUserId();
                petAsset.DateAdded = DateTime.Now;
                db.PetAssets.Add(petAsset);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            
            return View(petAsset);
        }

        // GET: PetAssets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PetAsset petAsset = db.PetAssets.Find(id);
            if (petAsset == null)
            {
                return HttpNotFound();
            }
            //ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FirstName", petAsset.OwnerId);
            return View(petAsset);
        }

        // POST: PetAssets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PetAssetId,PetName,OwnerId,PetPhoto,Notes,IsActive,DateAdded")] PetAsset petAsset, HttpPostedFileBase petimage)
        {
            if (ModelState.IsValid)
            {
                string imagename = petimage.FileName;
                string ext = imagename.Substring(imagename.LastIndexOf("."));
                string[] goodExts = { ".jpg", ".jpeg", ".png", ".gif" };
                if (goodExts.Contains(ext.ToLower()))
                {
                    petimage.SaveAs(Server.MapPath("~/Content/img/PetAssetsPics/" + imagename));
                    petAsset.PetPhoto = imagename;
                }
                db.Entry(petAsset).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OwnerId = new SelectList(db.UserDetails, "UserId", "FirstName", petAsset.OwnerId);
            return View(petAsset);
        }

        // GET: PetAssets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PetAsset petAsset = db.PetAssets.Find(id);
            if (petAsset == null)
            {
                return HttpNotFound();
            }
            return View(petAsset);
        }

        // POST: PetAssets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PetAsset petAsset = db.PetAssets.Find(id);
            db.PetAssets.Remove(petAsset);
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
