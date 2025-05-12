using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OgrenciDersTakip.Models;

namespace OgrenciDersTakip.Controllers
{
    public class BolumController : Controller
    {
        private readonly ApplicationDbContext _context;
        public BolumController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var bolumler = await _context.Bolumler.Include(b => b.Fakulte).ToListAsync();
            return View(bolumler);
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var bolum = await _context.Bolumler.Include(b => b.Fakulte)
                .FirstOrDefaultAsync(m => m.BolumID == id);
            if (bolum == null) return NotFound();
            return View(bolum);
        }

        public IActionResult Create()
        {
            ViewBag.Fakulteler = _context.Fakulteler.ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TBolum bolum)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Fakulteler = _context.Fakulteler.ToList();
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
                ViewBag.Errors = errors;
            }
            else
            {
                _context.Bolumler.Add(bolum);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(bolum);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var bolum = await _context.Bolumler.FindAsync(id);
            if (bolum == null) return NotFound();
            ViewBag.Fakulteler = _context.Fakulteler.ToList();
            return View(bolum);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TBolum bolum)
        {
            if (id != bolum.BolumID) return NotFound();
            if (ModelState.IsValid)
            {
                _context.Update(bolum);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Fakulteler = _context.Fakulteler.ToList();
            return View(bolum);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var bolum = await _context.Bolumler.Include(b => b.Fakulte)
                .FirstOrDefaultAsync(m => m.BolumID == id);
            if (bolum == null) return NotFound();
            return View(bolum);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var bolum = await _context.Bolumler.FindAsync(id);
            if (bolum != null)
            {
                _context.Bolumler.Remove(bolum);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}