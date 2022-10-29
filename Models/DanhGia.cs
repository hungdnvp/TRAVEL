namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhGia")]
    public partial class DanhGia
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaChiTietTK { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaTour { get; set; }

        public int? NumStar { get; set; }

        [StringLength(2000)]
        public string Review { get; set; }

        [StringLength(50)]
        public string ThoiGian { get; set; }

        public virtual ChiTietTK ChiTietTK { get; set; }

        public virtual Tour Tour { get; set; }
    }
}
