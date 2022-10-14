namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoi")]
    public partial class PhanHoi
    {
        [Key]
        public int MaPhanHoi { get; set; }

        [StringLength(1000)]
        public string NoiDung { get; set; }

        [StringLength(1000)]
        public string TraLoi { get; set; }

        public int? MaKH { get; set; }

        public virtual ChiTietTK ChiTietTK { get; set; }
    }
}
