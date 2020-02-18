namespace MyOT.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [Key]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(10)]
        public string IDStaff { get; set; }

        [Required]
        [StringLength(50)]
        public string FullName { get; set; }

        public int GroupTeamID { get; set; }

        [Required]
        [StringLength(200)]
        public string Password { get; set; }

        public int? Status { get; set; }

        public int? RoleID { get; set; }
    }
}
