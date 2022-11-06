namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BlogComment")]
    public partial class BlogComment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaComment { get; set; }

        public int? BlogID { get; set; }

        public int? MaTaiKhoan { get; set; }

        public string NoiDung { get; set; }

        public DateTime? NgayGio { get; set; }

        public virtual Blog Blog { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
