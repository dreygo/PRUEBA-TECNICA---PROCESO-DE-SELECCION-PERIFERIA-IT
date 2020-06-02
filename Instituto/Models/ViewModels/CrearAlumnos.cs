using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Instituto.Models.ViewModels
{
    public class CrearAlumnos
    {
        public ListAlumnos  NuevoAlumno { get; set; }
        public List<ListProgramas> Programas { get; set; }
    }
}