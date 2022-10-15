namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LinkImg")]
    public partial class LinkImg
    {
        [Key]
        [StringLength(10)]
        public string MaLink { get; set; }

        [Column("LinkImg")]
        [StringLength(100)]
        public string LinkImg1 { get; set; }

        public int? MaChiTietTour { get; set; }

        public virtual ChiTietTour ChiTietTour { get; set; }
    }
}
