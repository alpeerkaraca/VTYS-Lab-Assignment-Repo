using System.ComponentModel.DataAnnotations;

namespace OgrenciDersTakip.Models
{
    public class TFakulte
    {
        [Key]
        public int FakulteID { get; set; }
        [Required]
        public string FakulteAd { get; set; }
        public ICollection<TBolum> Bolumler { get; set; } = new List<TBolum>();
    }
}
