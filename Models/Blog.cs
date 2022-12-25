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
          [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
          public Blog()
          {
               BlogComments = new HashSet<BlogComment>();
          }

          [Key]
          public int Blog_ID { get; set; }

          [StringLength(100)]
          public string Ten { get; set; }

          [Column(TypeName = "ntext")]
          public string NoiDung { get; set; }

          [StringLength(100)]
          public string Link_Img { get; set; }

          public int? MaTaiKhoan { get; set; }

          [StringLength(50)]
          public string TacGia { get; set; }

          [Column(TypeName = "text")]
          public string MoTa { get; set; }

          [Column(TypeName = "date")]
          public DateTime NgayDang { get; set; }

          [StringLength(50)]
          public string Tag { get; set; }

          [StringLength(50)]
          public string Category { get; set; }

          [StringLength(50)]
          public string Link_CoverImg { get; set; }

          [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
          public virtual ICollection<BlogComment> BlogComments { get; set; }

          public virtual TaiKhoan TaiKhoan { get; set; }
     }
}
