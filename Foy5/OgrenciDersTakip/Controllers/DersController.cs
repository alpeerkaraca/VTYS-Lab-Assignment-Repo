using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OgrenciDersTakip.Models;

namespace OgrenciDersTakip.Controllers
{
    public class DersController : Controller
    {
        private readonly ApplicationDbContext _context;
        public DersController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Dersler.Include(d => d.Bolum).ToListAsync());
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var ders = await _context.Dersler.FirstOrDefaultAsync(m => m.DersID == id);
            if (ders == null) return NotFound();
            return View(ders);
        }

        public IActionResult Create()
        {
            ViewBag.Bolumler = _context.Bolumler.ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TDers ders)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Bolumler = _context.Bolumler.ToList();
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
                ViewBag.Errors = errors;
            }
            else
            {
                _context.Dersler.Add(ders);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(ders);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var ders = await _context.Dersler.FindAsync(id);
            if (ders == null) return NotFound();
            ViewBag.Bolumler = _context.Bolumler.ToList();
            return View(ders);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TDers ders)
        {
            if (id != ders.DersID) return NotFound();
            if (ModelState.IsValid)
            {
                _context.Update(ders);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Bolumler = _context.Bolumler.ToList();
            return View(ders);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var ders = await _context.Dersler
            .Include(d => d.Bolum)
            .FirstOrDefaultAsync(m => m.DersID == id);
            if (ders == null) return NotFound();
            return View(ders);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var ders = await _context.Dersler.FindAsync(id);
            if (ders != null)
            {
                _context.Dersler.Remove(ders);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
