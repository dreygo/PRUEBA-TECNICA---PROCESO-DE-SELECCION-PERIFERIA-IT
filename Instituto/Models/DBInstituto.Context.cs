﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Instituto.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class InstitutoEntities2 : DbContext
    {
        public InstitutoEntities2()
            : base("name=InstitutoEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<alumno> alumno { get; set; }
        public virtual DbSet<alumno_curso> alumno_curso { get; set; }
        public virtual DbSet<curso> curso { get; set; }
        public virtual DbSet<programa> programa { get; set; }
    
        public virtual int SP_RELACION_ALUMNO_CURSOS(Nullable<int> par_alum_id, Nullable<int> par_pro_id)
        {
            var par_alum_idParameter = par_alum_id.HasValue ?
                new ObjectParameter("par_alum_id", par_alum_id) :
                new ObjectParameter("par_alum_id", typeof(int));
    
            var par_pro_idParameter = par_pro_id.HasValue ?
                new ObjectParameter("par_pro_id", par_pro_id) :
                new ObjectParameter("par_pro_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_RELACION_ALUMNO_CURSOS", par_alum_idParameter, par_pro_idParameter);
        }
    
        public virtual ObjectResult<SP_CONSULTAR_ALUMNO_CURSOS_Result> SP_CONSULTAR_ALUMNO_CURSOS(Nullable<int> par_alum_id)
        {
            var par_alum_idParameter = par_alum_id.HasValue ?
                new ObjectParameter("par_alum_id", par_alum_id) :
                new ObjectParameter("par_alum_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_CONSULTAR_ALUMNO_CURSOS_Result>("SP_CONSULTAR_ALUMNO_CURSOS", par_alum_idParameter);
        }
    
        public virtual int SP_EDITAR_PROGRAMA_ALUMNO(Nullable<int> par_alum_id, Nullable<int> par_pro_id)
        {
            var par_alum_idParameter = par_alum_id.HasValue ?
                new ObjectParameter("par_alum_id", par_alum_id) :
                new ObjectParameter("par_alum_id", typeof(int));
    
            var par_pro_idParameter = par_pro_id.HasValue ?
                new ObjectParameter("par_pro_id", par_pro_id) :
                new ObjectParameter("par_pro_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SP_EDITAR_PROGRAMA_ALUMNO", par_alum_idParameter, par_pro_idParameter);
        }
    }
}
