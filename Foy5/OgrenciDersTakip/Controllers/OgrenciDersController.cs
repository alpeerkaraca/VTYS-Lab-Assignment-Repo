using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OgrenciDersTakip.Models;

namespace OgrenciDersTakip.Controllers
{
    public class OgrenciDersController : Controller
    {
        private readonly ApplicationDbContext _context;
        public OgrenciDersController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Assign(int? ogrenciId)
        {
            var ogrenciler = _context.Ogrenciler.Include(o => o.Bolum).ToList();
            ViewBag.Ogrenciler = ogrenciler;

            List<TDers> dersler;
            if (ogrenciId.HasValue)
            {
                var ogrenci = ogrenciler.FirstOrDefault(o => o.OgrenciID == ogrenciId.Value);
                dersler = ogrenci != null && ogrenci.Bolum != null // Öğrencinin bölümü olduğundan emin olun
                    ? _context.Dersler.Where(d => d.BolumID == ogrenci.BolumID).OrderBy(d => d.DersAd).ToList() // BolumID ile karşılaştırın
                    : new List<TDers>();
            }
            else
            {
                dersler = new List<TDers>(); // Başlangıçta ders listesi boş
            }
            ViewBag.Dersler = dersler;

            var model = new TOgrenciDers { OgrenciID = ogrenciId ?? 0 };
            model.Yil = DateTime.Now.Year;
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Assign(TOgrenciDers ogrenciDers)
        {
            if (ModelState.IsValid)
            {
                _context.OgrenciDersler.Add(ogrenciDers);
                await _context.SaveChangesAsync();
                return RedirectToAction("List");
            }
            ViewBag.Ogrenciler = _context.Ogrenciler.Include(o => o.Bolum).ToList();
            ViewBag.Dersler = _context.Dersler.ToList();
            return View(ogrenciDers);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ogrenciDers = await _context.OgrenciDersler
                .Include(od => od.Ogrenci)
                    .ThenInclude(o => o.Bolum)
                .Include(od => od.Ders)
                .FirstOrDefaultAsync(m => m.OgrenciDersID == id);

            if (ogrenciDers == null)
            {
                return NotFound();
            }

            // Dersleri, bu kayıttaki öğrencinin bölümüne göre filtrele
            if (ogrenciDers.Ogrenci != null && ogrenciDers.Ogrenci.Bolum != null)
            {
                ViewBag.Dersler = await _context.Dersler
                    .Where(d => d.BolumID == ogrenciDers.Ogrenci.BolumID)
                    .ToListAsync();
            }
            else
            {
                ViewBag.Dersler = new List<TDers>(); // Öğrenci veya bölüm bilgisi yoksa boş liste
            }

            return View(ogrenciDers);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OgrenciDersID,OgrenciID,DersID,Yil,Yariyil,Vize,Final")] TOgrenciDers ogrenciDersForm) // Parametre adını değiştirdim
        {
            if (id != ogrenciDersForm.OgrenciDersID)
            {
                return NotFound();
            }

            var existingOgrenciDers = await _context.OgrenciDersler.FindAsync(id);
            if (existingOgrenciDers == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    existingOgrenciDers.DersID = ogrenciDersForm.DersID;
                    existingOgrenciDers.Yil = ogrenciDersForm.Yil;
                    existingOgrenciDers.Yariyil = ogrenciDersForm.Yariyil;
                    existingOgrenciDers.Vize = ogrenciDersForm.Vize;
                    existingOgrenciDers.Final = ogrenciDersForm.Final;

                    _context.Update(existingOgrenciDers);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TOgrenciDersExists(ogrenciDersForm.OgrenciDersID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(List));
            }

            var studentForDersler = await _context.Ogrenciler
                                            .Include(o => o.Bolum)
                                            .FirstOrDefaultAsync(o => o.OgrenciID == existingOgrenciDers.OgrenciID); // Formdan gelen yerine mevcut kaydın OgrenciID'sini kullan
            if (studentForDersler != null && studentForDersler.Bolum != null)
            {
                ViewBag.Dersler = await _context.Dersler
                    .Where(d => d.BolumID == studentForDersler.BolumID)
                    .ToListAsync();
            }
            else
            {
                ViewBag.Dersler = new List<TDers>();
            }
            return View(ogrenciDersForm);
        }

        private bool TOgrenciDersExists(int id)
        {
            return _context.OgrenciDersler.Any(e => e.OgrenciDersID == id);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();
            var ogrenciDers = await _context.OgrenciDersler.Include(od => od.Ogrenci).Include(od => od.Ders).FirstOrDefaultAsync(od => od.OgrenciDersID == id);
            if (ogrenciDers == null) return NotFound();
            return View(ogrenciDers);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var ogrenciDers = await _context.OgrenciDersler.FindAsync(id);
            if (ogrenciDers != null)
            {
                _context.OgrenciDersler.Remove(ogrenciDers);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("List");
        }

        public async Task<IActionResult> List(int? filterDersId)
        {
            IQueryable<TOgrenciDers> query = _context.OgrenciDersler
                                        .Include(t => t.Ders)
                                        .Include(t => t.Ogrenci)
                                            .ThenInclude(o => o.Bolum);

            if (filterDersId.HasValue)
            {
                query = query.Where(od => od.DersID == filterDersId.Value);
            }

            var list = await query.OrderBy(od => od.Ogrenci.Soyad)
                                  .ThenBy(od => od.Ogrenci.Ad)
                                  .ToListAsync();

            ViewBag.DerslerListesi = new SelectList(_context.Dersler.OrderBy(d => d.DersAd).ToList(), "DersID", "DersAd", filterDersId);
            ViewBag.CurrentDersId = filterDersId;

            return View(list);
        }

        public IActionResult StudentCourses(int ogrenciId)
        {
            var dersler = _context.OgrenciDersler.Include(od => od.Ders).Where(od => od.OgrenciID == ogrenciId).ToList();
            ViewBag.Ogrenci = _context.Ogrenciler.Find(ogrenciId);
            return View(dersler);
        }

        public IActionResult CourseStats(int yil, string yariyil)
        {
            var stats = _context.OgrenciDersler.Include(od => od.Ders)
                .Where(od => od.Yil == yil && od.Yariyil == yariyil)
                .GroupBy(od => od.Ders.DersAd)
                .Select(g => new { DersAd = g.Key, OgrenciSayisi = g.Count() }).ToList();
            ViewBag.Yil = yil;
            ViewBag.Yariyil = yariyil;
            return View(stats);
        }

        public IActionResult StudentsOfCourse(int dersId, int yil, string yariyil)
        {
            var ogrenciler = _context.OgrenciDersler.Include(od => od.Ogrenci)
                .Where(od => od.DersID == dersId && od.Yil == yil && od.Yariyil == yariyil).ToList();
            ViewBag.Ders = _context.Dersler.Find(dersId);
            ViewBag.Yil = yil;
            ViewBag.Yariyil = yariyil;
            return View(ogrenciler);
        }

        public async Task<IActionResult> GradeEntry(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ogrenciDers = await _context.OgrenciDersler
                .Include(od => od.Ogrenci) 
                .Include(od => od.Ders)
                .FirstOrDefaultAsync(m => m.OgrenciDersID == id);

            if (ogrenciDers == null)
            {
                return NotFound();
            }
            return View(ogrenciDers);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> GradeEntry(int id, [Bind("OgrenciDersID,OgrenciID,DersID,Yil,Yariyil,Vize,Final")] TOgrenciDers ogrenciDersForm)
        {
            if (id != ogrenciDersForm.OgrenciDersID)
            {
                return NotFound();
            }

            var existingOgrenciDers = await _context.OgrenciDersler.FindAsync(id);
            if (existingOgrenciDers == null)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    existingOgrenciDers.Vize = ogrenciDersForm.Vize;
                    existingOgrenciDers.Final = ogrenciDersForm.Final;

                    _context.Update(existingOgrenciDers);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TOgrenciDersExists(ogrenciDersForm.OgrenciDersID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(List), new { filterDersId = existingOgrenciDers.DersID });
            }

            // ModelState geçerli değilse, öğrenci ve ders bilgilerini tekrar yükleyip view'e gönder.
            var ogrenciDersForView = await _context.OgrenciDersler
                .Include(od => od.Ogrenci)
                .Include(od => od.Ders)
                .FirstOrDefaultAsync(m => m.OgrenciDersID == id);

            return View(ogrenciDersForView); // Hatalı formu ve yüklenmiş verileri geri gönder
        }

        public IActionResult StudentCoursesByNo(string ogrenciNo)
        {
            if (string.IsNullOrWhiteSpace(ogrenciNo))
            {
                ViewBag.Error = "Öğrenci numarası giriniz.";
                return View(new List<TOgrenciDers>());
            }
            var ogrenci = _context.Ogrenciler.FirstOrDefault(o => o.OgrenciNo == ogrenciNo);
            if (ogrenci == null)
            {
                ViewBag.Error = "Öğrenci bulunamadı.";
                return View(new List<TOgrenciDers>());
            }
            var dersler = _context.OgrenciDersler.Include(od => od.Ders).Where(od => od.OgrenciID == ogrenci.OgrenciID).ToList();
            ViewBag.Ogrenci = ogrenci;
            return View(dersler);
        }

        public IActionResult CourseStatsForm()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CourseStatsResult(int yil, string yariyil)
        {
            var stats = _context.OgrenciDersler.Include(od => od.Ders)
                .Where(od => od.Yil == yil && od.Yariyil == yariyil)
                .GroupBy(od => od.Ders.DersAd)
                .Select(g => new { DersAd = g.Key, OgrenciSayisi = g.Count() }).ToList();
            ViewBag.Yil = yil;
            ViewBag.Yariyil = yariyil;
            return View(stats);
        }
    }
}
