using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OgrenciDersTakip.Models
{
    public class TBolum
    {
        [Key]
        public int BolumID { get; set; }
        public string BolumAd { get; set; }
        [ForeignKey("Fakulte")]
        public int FakulteID { get; set; }
        public TFakulte? Fakulte { get; set; }
        public ICollection<TOgrenci> Ogrenciler { get; set; } = new List<TOgrenci>();
    }
}
