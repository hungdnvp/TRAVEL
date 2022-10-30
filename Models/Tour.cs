namespace TRAVEL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tour")]
    public partial class Tour
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tour()
        {
            BangGias = new HashSet<BangGia>();
            DanhGias = new HashSet<DanhGia>();
            PhieuDatTours = new HashSet<PhieuDatTour>();
            DichVus = new HashSet<DichVu>();
            DiaDanhs = new HashSet<DiaDanh>();
            TravelTypes = new HashSet<TravelType>();
        }

        [Key]
        public int MaTour { get; set; }

        [StringLength(100)]
        public string TenTour { get; set; }

        [StringLength(100)]
        public string Mota { get; set; }

        public decimal? Gia { get; set; }

        public int? MaChiTietTour { get; set; }

        public int? NumView { get; set; }

        [StringLength(100)]
        public string LinkImage { get; set; }

        [StringLength(100)]
        public string DiaDiem { get; set; }

        public int? NumDay { get; set; }

        [StringLength(200)]
        public string LinkVideo { get; set; }

        [StringLength(20)]
        public string lat { get; set; }

        [StringLength(20)]
        public string lng { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BangGia> BangGias { get; set; }

        public virtual ChiTietTour ChiTietTour { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGia> DanhGias { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuDatTour> PhieuDatTours { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DichVu> DichVus { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DiaDanh> DiaDanhs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TravelType> TravelTypes { get; set; }
    }
}
