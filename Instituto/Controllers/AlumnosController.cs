using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Instituto.Models;
using Instituto.Models.ViewModels;

namespace Instituto.Controllers
{
    public class AlumnosController : Controller
    {
        // GET: Alumnos
        public ActionResult Index()
        {
            List<ListAlumnos> Alumnos = new List<ListAlumnos>();

            using (InstitutoEntities2 db = new InstitutoEntities2())
            {
                Alumnos = (from d in db.alumno
                           select new ListAlumnos
                           {
                               Alum_id = d.alum_id,
                               Alum_nombre = d.alum_nombre,
                               Alum_apellido = d.alum_apellido,
                               Alum_cedula = d.alum_cedula,
                               Alum_fecha_nacimiento = d.alum_fecha_nacimiento,
                               Alum_edad = 0,
                               Alum_correo = d.alum_correo,
                           }).ToList();
            }
            return View(Alumnos);
        }


        // GET: Alumnos/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Alumnos/Create
        public ActionResult Create()
        {
            List<ListProgramas> Programas = new List<ListProgramas>();
            CrearAlumnos nuevoAlumno = new CrearAlumnos();

            using (InstitutoEntities2 db = new InstitutoEntities2())
            {
                Programas = (from d in db.programa
                           select new ListProgramas
                           {
                               pro_id = d.pro_id.ToString(),
                               pro_nombre = d.pro_nombre,
                           }).ToList();
            }
            nuevoAlumno.Programas = Programas;
            return View(nuevoAlumno);
        }

        // POST: Alumnos/Create
        [HttpPost]
        public ActionResult Create(CrearAlumnos nuevo)
        {
            try
            {
                // TODO: Add insert logic here
                if(ModelState.IsValid)
                {
                    using (InstitutoEntities2 db = new InstitutoEntities2())
                    {
                        //creacion del alumno 
                        var otabla = new alumno();
                        otabla.alum_nombre = nuevo.NuevoAlumno.Alum_nombre;
                        otabla.alum_apellido = nuevo.NuevoAlumno.Alum_apellido;
                        otabla.alum_cedula = nuevo.NuevoAlumno.Alum_cedula;
                        otabla.alum_fecha_nacimiento = nuevo.NuevoAlumno.Alum_fecha_nacimiento;
                        otabla.alum_correo = nuevo.NuevoAlumno.Alum_correo;

                        db.alumno.Add(otabla);
                        db.SaveChanges();

                        //Creacion de las relaciones alumno curso segun programa seleccionado
                        int id = db.alumno.Find(db.alumno.Max(p => p.alum_id)).alum_id;
                        db.SP_RELACION_ALUMNO_CURSOS(id, nuevo.NuevoAlumno.Pro_id);
                        db.SaveChanges();
                    }


                    return RedirectToAction("Index", "Alumnos");
                }
                else
                {
                    List<ListProgramas> Programas = new List<ListProgramas>();
                    CrearAlumnos nuevoAlumno = new CrearAlumnos();

                    using (InstitutoEntities2 db = new InstitutoEntities2())
                    {
                        Programas = (from d in db.programa
                                     select new ListProgramas
                                     {
                                         pro_id = d.pro_id.ToString(),
                                         pro_nombre = d.pro_nombre,
                                     }).ToList();
                    }
                    nuevoAlumno.Programas = Programas;
                    return View(nuevoAlumno);
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
                //return View();
            }
        }

        // GET: Alumnos/Edit/5
        public ActionResult Edit(int id)
        {
            ListAlumnos alumnos = new ListAlumnos();
            List<ListProgramas> Programas = new List<ListProgramas>();
            CrearAlumnos nuevoAlumno = new CrearAlumnos();
            using (InstitutoEntities2 db = new InstitutoEntities2())
            {
                var oAlum = db.alumno.Find(id);
                alumnos.Alum_id = oAlum.alum_id;
                alumnos.Alum_nombre = oAlum.alum_nombre;
                alumnos.Alum_apellido = oAlum.alum_apellido;
                alumnos.Alum_cedula = oAlum.alum_cedula;
                alumnos.Alum_fecha_nacimiento = oAlum.alum_fecha_nacimiento;
                alumnos.Alum_correo = oAlum.alum_correo;  
                               
                Programas = (from d in db.programa
                                select new ListProgramas
                                {
                                    pro_id = d.pro_id.ToString(),
                                    pro_nombre = d.pro_nombre,
                                }).ToList();
              
                nuevoAlumno.Programas = Programas;
                nuevoAlumno.NuevoAlumno = alumnos;
                
            }
            return View(nuevoAlumno);
        }

        // POST: Alumnos/Edit/5
        [HttpPost]
        public ActionResult Edit(CrearAlumnos model)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    using (InstitutoEntities2 db = new InstitutoEntities2())
                    {
                        var otabla = db.alumno.Find(model.NuevoAlumno.Alum_id);
                        otabla.alum_nombre = model.NuevoAlumno.Alum_nombre;
                        otabla.alum_apellido = model.NuevoAlumno.Alum_apellido;
                        otabla.alum_cedula = model.NuevoAlumno.Alum_cedula;
                        otabla.alum_fecha_nacimiento = model.NuevoAlumno.Alum_fecha_nacimiento;
                        otabla.alum_correo = model.NuevoAlumno.Alum_correo;

                        db.Entry(otabla).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();

                        //Creacion de las relaciones alumno curso segun programa seleccionado
                        int id = model.NuevoAlumno.Alum_id;
                        db.SP_EDITAR_PROGRAMA_ALUMNO(id, model.NuevoAlumno.Pro_id);
                        db.SaveChanges();
                    }
                    return RedirectToAction("Index", "Alumnos");
                }
                else
                {
                    List<ListProgramas> Programas = new List<ListProgramas>();

                    using (InstitutoEntities2 db = new InstitutoEntities2())
                    {
                        Programas = (from d in db.programa
                                     select new ListProgramas
                                     {
                                         pro_id = d.pro_id.ToString(),
                                         pro_nombre = d.pro_nombre,
                                     }).ToList();
                    }
                    model.Programas = Programas;
                    return View(model);
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                //return View();
            }
        }

        // POST: Alumnos/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            using (InstitutoEntities2 db = new InstitutoEntities2())
            {
                var oItem = db.alumno.Find(id);
                db.alumno.Remove(oItem);
                db.SaveChanges();

            }
            return RedirectToAction("Index", "Alumnos");
        }
        // GET: Alumnos/Cursos/5
        public ActionResult Cursos(int id)
        {
            List<ListaCursosAlumnos> CursosAlumno = new List<ListaCursosAlumnos>();
            using (InstitutoEntities2 db = new InstitutoEntities2())
            {
                CursosAlumno = (from d in db.SP_CONSULTAR_ALUMNO_CURSOS(id)
                           select new ListaCursosAlumnos
                           {
                               Alum_nombre = d.alum_nombre,
                               Alum_apellido = d.alum_apellido,
                               Pro_nombre = d.pro_nombre,
                               Cur_nombre = d.cur_nombre,
                           }).ToList();
            }
            return View(CursosAlumno);
        }
    }
}
