//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ngay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ngay()
        {
            this.ChiTietNgays = new HashSet<ChiTietNgay>();
        }
    
        public int MaNgay { get; set; }
        public string TieuDe { get; set; }
        public int MaChiTietTour { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietNgay> ChiTietNgays { get; set; }
        public virtual ChiTietTour ChiTietTour { get; set; }
    }
}
