using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Instituto.Models.ViewModels
{
    public class ListProgramas
    {

        public string pro_id { get; set; }
        [Required]
        [Display(Name = "Programa")]
        public string pro_nombre { get; set; }
    }
}