using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Instituto.Models.ViewModels
{
    public class ListaCursosAlumnos
    {

        [Required]
        [Display(Name = "Nombre")]
        public string Alum_nombre { get; set; }
        [Required]
        [Display(Name = "Apellido")]
        public string Alum_apellido { get; set; }
        [Required]
        [Display(Name = "Programa")]
        public string Pro_nombre { get; set; }

        [Required]
        [Display(Name = "Curso")]
        public string Cur_nombre { get; set; }
    }
}