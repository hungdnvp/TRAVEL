namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DichVuTour")]
    public partial class DichVuTour
    {
        [Key]
        public int MaDichVuTour { get; set; }

        [StringLength(100)]
        public string TenDichVu { get; set; }

        public int? MaChiTietTour { get; set; }

        public virtual ChiTietTour ChiTietTour { get; set; }
    }
}
