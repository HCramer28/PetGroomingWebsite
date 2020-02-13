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

    public class ReservationsController : Controller
    {
        private PetGroomingEntities db = new PetGroomingEntities();

        // GET: Reservations
        public ActionResult Index()
        {

            if (User.IsInRole("Admin") || User.IsInRole("Employee"))
            {
                var reservations = db.Reservations.Include(r => r.Location).Include(r => r.PetAsset);
                return View(reservations.ToList());
            }

            else
            {
                string currentUser = User.Identity.GetUserId();
                var reservations = db.Reservations.Where(pa => pa.PetAsset.OwnerId == currentUser);
                return View(reservations.ToList());
            }

        }


        // GET: Reservations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // GET: Reservations/Create
        public ActionResult Create()
        {

            string currentUser = User.Identity.GetUserId();
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName");
            ViewBag.PetAssetId = new SelectList(db.PetAssets.Where(pa => pa.OwnerId == currentUser), "PetAssetId", "PetName", "OwenerId");

            return View();
        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationId,LocationId,ReservationDate,PetAssetId")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                var loc = db.Locations.Where(x => x.LocationId == reservation.LocationId).FirstOrDefault();
                int limit = loc.ReservationLimit;
                var dayDate = db.Reservations.Where(x => x.ReservationDate == reservation.ReservationDate
                && x.LocationId == reservation.LocationId).Count();
                if (limit > dayDate)
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.Message = ("This date is full for this location. Please choose another date and(or) location.");
                    return RedirectToAction("Create");
                }

                
            }

            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservation.LocationId);
            ViewBag.PetAssetId = new SelectList(db.PetAssets, "PetAssetId", "PetName", reservation.PetAssetId);
            return View(reservation);
        }

        // GET: Reservations/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            string currentUser = User.Identity.GetUserId();
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservation.LocationId);
            ViewBag.PetAssetId = new SelectList(db.PetAssets.Where(pa => pa.OwnerId == currentUser), "PetAssetId", "PetName", reservation.PetAssetId);
            return View(reservation);
        }

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationId,LocationId,ReservationDate,PetAssetId")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationId = new SelectList(db.Locations, "LocationId", "LocationName", reservation.LocationId);
            ViewBag.PetAssetId = new SelectList(db.PetAssets, "PetAssetId", "PetName", reservation.PetAssetId);
            return View(reservation);
        }

        // GET: Reservations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Reservations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservations.Find(id);
            db.Reservations.Remove(reservation);
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
