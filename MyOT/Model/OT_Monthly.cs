namespace MyOT.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OT_Monthly
    {
        [Key]
        public int ID_OT_Monthly { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Title { get; set; }

        public double? HourOver10Percent { get; set; }

        public int? TeamRule { get; set; }

        public DateTime? DateOpen { get; set; }

        public DateTime? ExpDateSubmit { get; set; }

        [StringLength(50)]
        public string AliasTime { get; set; }
    }
}
