namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Reply")]
    public partial class Reply
    {
        [Key]
        public int MaReply { get; set; }

        public int? MaCmt { get; set; }

        public int? MaTaiKhoan { get; set; }

        public string NoiDung { get; set; }

        public DateTime? NgayGio { get; set; }

        public virtual BlogComment BlogComment { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
