using Microsoft.EntityFrameworkCore;

namespace OgrenciDersTakip.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<TOgrenci> Ogrenciler { get; set; }
        public DbSet<TBolum> Bolumler { get; set; }
        public DbSet<TFakulte> Fakulteler { get; set; }
        public DbSet<TDers> Dersler { get; set; }
        public DbSet<TOgrenciDers> OgrenciDersler { get; set; }
    }
}
