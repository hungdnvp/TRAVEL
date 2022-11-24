namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Vung_DiaDanh
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDiaDanh { get; set; }

        [StringLength(100)]
        public string TenDiaDanh { get; set; }

        [StringLength(100)]
        public string Img { get; set; }

        [StringLength(1000)]
        public string MoTa { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Mavung { get; set; }

        [StringLength(100)]
        public string TenVung { get; set; }
    }
}
