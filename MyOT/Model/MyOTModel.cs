namespace MyOT.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyOTModel : DbContext
    {
        public MyOTModel()
            : base("name=MyOTeFModel")
        {
        }

        public virtual DbSet<OT_History> OT_History { get; set; }
        public virtual DbSet<OT_Monthly> OT_Monthly { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<OT_History>()
                .Property(e => e.Date)
                .IsFixedLength();
        }
    }
}
