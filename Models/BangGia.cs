namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BangGia")]
    public partial class BangGia
    {
        [Key]
        public int MaBangGia { get; set; }

        public int? GiaVN_EmBe { get; set; }

        public int? GiaVN_TreEm { get; set; }

        public int? GiaVN_NguoiLon { get; set; }

        public int? GiaVK_EmBe { get; set; }

        public int? GiaVK_TreEm { get; set; }

        public int? GiaVK_NguoiLon { get; set; }

        public int? GiaNQ_EmBe { get; set; }

        public int? GiaNQ_TreEm { get; set; }

        public int? GiaNQ_NguoiLon { get; set; }

        public int? MaTour { get; set; }

        public virtual Tour Tour { get; set; }
    }
}
