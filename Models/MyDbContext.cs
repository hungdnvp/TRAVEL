using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace TRAVEL.Models
{
    public partial class MyDbContext : DbContext
    {
        public MyDbContext()
            : base("name=MyDbContext")
        {
        }

        public virtual DbSet<BangGia> BangGias { get; set; }
        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<ChiTietNgay> ChiTietNgays { get; set; }
        public virtual DbSet<ChiTietTK> ChiTietTKs { get; set; }
        public virtual DbSet<ChiTietTour> ChiTietTours { get; set; }
        public virtual DbSet<DanhGia> DanhGias { get; set; }
        public virtual DbSet<DiaDanh> DiaDanhs { get; set; }
        public virtual DbSet<DichVu> DichVus { get; set; }
        public virtual DbSet<LinkImg> LinkImgs { get; set; }
        public virtual DbSet<Ngay> Ngays { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<PhieuDatTour> PhieuDatTours { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<Tour> Tours { get; set; }
        public virtual DbSet<TravelType> TravelTypes { get; set; }
        public virtual DbSet<Vung> Vungs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Blog>()
                .Property(e => e.NoiDung)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietTK>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietTK>()
                .Property(e => e.LinkAvatar)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietTK>()
                .HasMany(e => e.DanhGias)
                .WithRequired(e => e.ChiTietTK)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ChiTietTour>()
                .HasMany(e => e.Ngays)
                .WithRequired(e => e.ChiTietTour)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DanhGia>()
                .Property(e => e.ThoiGian)
                .IsUnicode(false);

            modelBuilder.Entity<DiaDanh>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<DiaDanh>()
                .Property(e => e.MoTa)
                .IsUnicode(false);

            modelBuilder.Entity<DiaDanh>()
                .HasMany(e => e.Tours)
                .WithMany(e => e.DiaDanhs)
                .Map(m => m.ToTable("Tour_DiaDanh").MapLeftKey("MaDiaDanh").MapRightKey("MaTour"));

            modelBuilder.Entity<DichVu>()
                .HasMany(e => e.Tours)
                .WithMany(e => e.DichVus)
                .Map(m => m.ToTable("DichVu_Tour").MapLeftKey("MaDichVu").MapRightKey("MaTour"));

            modelBuilder.Entity<LinkImg>()
                .Property(e => e.MaLink)
                .IsUnicode(false);

            modelBuilder.Entity<LinkImg>()
                .Property(e => e.LinkImg1)
                .IsUnicode(false);

            modelBuilder.Entity<Ngay>()
                .HasMany(e => e.ChiTietNgays)
                .WithRequired(e => e.Ngay)
                .HasForeignKey(e => new { e.MaNgay, e.MaChiTietTour })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.pass)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.role)
                .IsFixedLength();

            modelBuilder.Entity<Tour>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Tour>()
                .Property(e => e.LinkImage)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.LinkVideo)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.lat)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.lng)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .HasMany(e => e.DanhGias)
                .WithRequired(e => e.Tour)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tour>()
                .HasMany(e => e.TravelTypes)
                .WithMany(e => e.Tours)
                .Map(m => m.ToTable("Tour_TravelType").MapLeftKey("MaTour").MapRightKey("MaTravelType"));
        }
    }
}
