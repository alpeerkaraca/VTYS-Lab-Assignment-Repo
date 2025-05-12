using System.ComponentModel.DataAnnotations;

namespace OgrenciDersTakip.Models
{
    public class TDers
    {
        [Key]
        public int DersID { get; set; }
        [Required]
        public string DersAd { get; set; }
        [Required]
        public int BolumID { get; set; }
        public TBolum? Bolum { get; set; }
        public ICollection<TOgrenciDers> OgrenciDersler { get; set; } = new List<TOgrenciDers>();
    }
}
