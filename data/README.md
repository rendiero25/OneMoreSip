# Database Minuman — Draft Referensi v0.1.0

163 minuman dari 13 kategori, mencakup pasar GLOBAL, ID, MY, US, GB, JP, IN, SA, AE, TR, MX, BR.

## Status
**Draft referensi.** Nilai adalah angka tipikal dan **belum diverifikasi per FDC ID**.
Jalankan `verify_fdc.py` dan tinjau baris berflag `CHECK` sebelum dipakai di produksi.
Baris `confidence: low` (umumnya minuman racikan rumahan) sebaiknya ditinjau manual.

## Aturan hidrasi
- `hydration_ml = volume_ml × hydration_factor`
- `hydration_factor = water_pct / 100` (maksimal 1,0)
- Minuman beralkohol: factor 0, `counts_toward_goal = false` (tetap bisa dicatat)
- Tidak memakai pengali Beverage Hydration Index (>1), agar aplikasi tidak mendorong
  penggantian air putih dengan susu/jus.

## Kolom
| Kolom | Arti |
|---|---|
| id | ID unik (snake_case), dipakai juga sebagai key terjemahan ARB |
| name_en / name_id | Nama Inggris / Indonesia |
| local_name | Nama asli di negara asal (jika ada) |
| category | water, coconut, coffee, tea, dairy, plant_milk, juice, smoothie, soda, sports, energy, traditional, alcohol |
| countries | Kode pasar; di CSV dipisah `|` |
| default_serving_ml | Ukuran sajian default |
| water_pct | Kadar air (%) |
| hydration_factor | Faktor yang dihitung ke target |
| counts_toward_goal | Apakah dihitung ke target harian |
| is_alcoholic | Minuman beralkohol |
| sugar_g_per_100ml | Total gula termasuk gula alami (laktosa, fruktosa) |
| caffeine_mg_per_100ml | Kafein |
| confidence | high / medium / low |
| source_basis | fdc_generic, label_typical, recipe_estimate, standard_formula |
| fdc_search_query | Kata kunci pencarian FDC untuk verifikasi |
| note_id | Catatan (Bahasa Indonesia) |
| verified | Ubah ke true setelah diverifikasi |

## Sumber
- U.S. Department of Agriculture, Agricultural Research Service. FoodData Central. https://fdc.nal.usda.gov/ (CC0 1.0 — cantumkan sebagai sumber di halaman "Sumber Data" aplikasi)
- Maughan RJ et al. (2016). Am J Clin Nutr 103(3):717–723 — rujukan metodologi
- Formula oralit osmolaritas rendah WHO/UNICEF

## Catatan
- Nama generik dipakai untuk produk bermerek (hindari merek dagang).
- Nilai per 100 g FDC dianggap setara 100 ml untuk minuman encer.
- Tampilkan di aplikasi bahwa angka adalah perkiraan, bukan klaim medis.
