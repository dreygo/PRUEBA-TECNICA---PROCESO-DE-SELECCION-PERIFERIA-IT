using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Instituto.Models.ViewModels
{
    public class ListAlumnos
    {        
        public int Alum_id { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name ="Nombre")]
        public string Alum_nombre { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Apellido")]
        public string Alum_apellido { get; set; }
        [Required]
        [Display(Name = "Cedula")]
        public int Alum_cedula { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Fecha nacimiento")]
        public DateTime Alum_fecha_nacimiento { get; set; }
        [Required]
        [Display(Name = "Edad")]
        public int Alum_edad { get; set; }
        [Required]
        [Display(Name = "Correo electrónico")]
        [EmailAddress]
        public string Alum_correo { get; set; }
        [Required]
        [Display(Name = "Programa")]
        public int Pro_id { get; set; }
    }
}