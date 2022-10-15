namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuDatTour")]
    public partial class PhieuDatTour
    {
        [Key]
        public int MaPhieuDat { get; set; }

        public int? MaChiTietTK { get; set; }

        public int? MaTour { get; set; }

        public virtual ChiTietTK ChiTietTK { get; set; }

        public virtual Tour Tour { get; set; }
    }
}
