using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OgrenciDersTakip.Models;

namespace OgrenciDersTakip.Controllers
{
    public class OgrenciController : Controller
    {
        private readonly ApplicationDbContext _context;
        public OgrenciController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var ogrenciler = await _context.Ogrenciler.Include(o => o.Bolum).ToListAsync();
            return View(ogrenciler);
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var ogrenci = await _context.Ogrenciler.Include(o => o.Bolum)
                .FirstOrDefaultAsync(m => m.OgrenciID == id);
            if (ogrenci == null) return NotFound();
            return View(ogrenci);
        }

        public IActionResult Create()
        {
            ViewBag.Bolumler = _context.Bolumler.ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TOgrenci ogrenci)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Bolumler = _context.Bolumler.ToList();
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
                ViewBag.Errors = errors;
            }
            else
            {
                _context.Ogrenciler.Add(ogrenci);
                await _context.SaveChangesAsync();
                return RedirectToAction("List"); // Eğer List yoksa Index olarak değiştirin
            }
            return View(ogrenci);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var ogrenci = await _context.Ogrenciler.FindAsync(id);
            if (ogrenci == null) return NotFound();
            ViewBag.Bolumler = _context.Bolumler.ToList();
            return View(ogrenci);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TOgrenci ogrenci)
        {
            if (id != ogrenci.OgrenciID) return NotFound();
            if (ModelState.IsValid)
            {
                _context.Update(ogrenci);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Bolumler = _context.Bolumler.ToList();
            return View(ogrenci);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var ogrenci = await _context.Ogrenciler.Include(o => o.Bolum)
                .FirstOrDefaultAsync(m => m.OgrenciID == id);
            if (ogrenci == null) return NotFound();
            return View(ogrenci);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var ogrenci = await _context.Ogrenciler.FindAsync(id);
            if (ogrenci != null)
            {
                _context.Ogrenciler.Remove(ogrenci);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> List()
        {
            var ogrenciler = await _context.Ogrenciler.Include(o => o.Bolum).ToListAsync();
            return View("Index", ogrenciler);
        }
    }
}
