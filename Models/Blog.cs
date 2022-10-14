namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Blog")]
    public partial class Blog
    {
        [Key]
        public int Blog_ID { get; set; }

        [StringLength(100)]
        public string Ten { get; set; }

        [Column(TypeName = "text")]
        public string NoiDung { get; set; }

        [StringLength(100)]
        public string Link_Image { get; set; }

        public int? MaTaiKhoan { get; set; }

        [StringLength(50)]
        public string TacGia { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
