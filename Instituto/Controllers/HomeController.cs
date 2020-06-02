using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Instituto.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Certificasiones del ingeniero a cargo de la prueba";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Title = "Ingeniero de sistemas - Carlos Alberto Roa Vique";
            ViewBag.Message = "Bogotá, Colombia.";

            return View();
        }
    }
}