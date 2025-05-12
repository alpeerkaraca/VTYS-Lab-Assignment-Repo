using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OgrenciDersTakip.Models;

namespace OgrenciDersTakip.Controllers
{
    public class FakulteController : Controller
    {
        private readonly ApplicationDbContext _context;
        public FakulteController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Fakulteler.ToListAsync());
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();
            var fakulte = await _context.Fakulteler.FirstOrDefaultAsync(m => m.FakulteID == id);
            if (fakulte == null) return NotFound();
            return View(fakulte);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(TFakulte fakulte)
        {
            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
                ViewBag.Errors = errors;
            }
            else
            {
                _context.Fakulteler.Add(fakulte);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(fakulte);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();
            var fakulte = await _context.Fakulteler.FindAsync(id);
            if (fakulte == null) return NotFound();
            return View(fakulte);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, TFakulte fakulte)
        {
            if (id != fakulte.FakulteID) return NotFound();
            if (ModelState.IsValid)
            {
                _context.Update(fakulte);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(fakulte);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var fakulte = await _context.Fakulteler.FirstOrDefaultAsync(m => m.FakulteID == id);
            if (fakulte == null) return NotFound();
            return View(fakulte);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var fakulte = await _context.Fakulteler.FindAsync(id);
            if (fakulte != null)
            {
                _context.Fakulteler.Remove(fakulte);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
