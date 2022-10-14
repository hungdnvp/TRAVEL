namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietNgay")]
    public partial class ChiTietNgay
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaNgay { get; set; }

        [StringLength(2000)]
        public string NoiDung { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaChiTietTour { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(100)]
        public string GioHoatDong { get; set; }

        public virtual Ngay Ngay { get; set; }
    }
}
