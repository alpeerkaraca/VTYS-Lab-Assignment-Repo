using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OgrenciDersTakip.Models
{
    public class TOgrenciDers
    {
        [Key]
        public int OgrenciDersID { get; set; }
        [Required]
        [ForeignKey("Ogrenci")]
        public int OgrenciID { get; set; }
        public TOgrenci? Ogrenci { get; set; }
        [Required]
        [ForeignKey("Ders")]
        public int DersID { get; set; }
        public TDers? Ders { get; set; }
        [Required]
        public int Yil { get; set; }
        [Required]
        public string Yariyil { get; set; }
        public double? Vize { get; set; }
        public double? Final { get; set; }
    }
}
