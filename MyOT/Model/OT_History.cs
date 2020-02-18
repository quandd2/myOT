namespace MyOT.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OT_History
    {
        [StringLength(50)]
        public string Email { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [StringLength(50)]
        public string FullName { get; set; }

        [StringLength(50)]
        public string StaffID { get; set; }

        [StringLength(10)]
        public string Date { get; set; }

        [StringLength(50)]
        public string StartTime { get; set; }

        [StringLength(50)]
        public string EndTime { get; set; }

        public double? Hours { get; set; }

        [StringLength(1050)]
        public string AdditionalNote { get; set; }

        [StringLength(100)]
        public string Address { get; set; }

        public int? FileCode { get; set; }

        public int? Status { get; set; }

        public DateTime? DateChange { get; set; }

        public DateTime? DateInit { get; set; }

        public int? ID_OT_Monthly { get; set; }

        public int? FlagOver10 { get; set; }
    }
}
