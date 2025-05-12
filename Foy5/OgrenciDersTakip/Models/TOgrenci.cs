using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OgrenciDersTakip.Models
{
    public class TOgrenci
    {
        [Key]
        public int OgrenciID { get; set; }
        [Required]
        public string Ad { get; set; }
        [Required]
        public string Soyad { get; set; }
        [ForeignKey("Bolum")]
        public int BolumID { get; set; }
        public TBolum? Bolum { get; set; }
        public ICollection<TOgrenciDers> OgrenciDersler { get; set; } = new List<TOgrenciDers>();
        [Required]
        public string OgrenciNo { get; set; }
    }
}
