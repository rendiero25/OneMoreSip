"""
Verifikasi drinks.json terhadap USDA FoodData Central (FDC).

Cara pakai:
  1. Ambil API key gratis di https://fdc.nal.usda.gov/api-key-signup
  2. export FDC_API_KEY=xxxx
  3. python verify_fdc.py
Output: fdc_report.csv berisi nilai FDC vs nilai di database, plus flag selisih.

Catatan:
- FDC memakai satuan per 100 g; untuk minuman encer dianggap setara 100 ml.
- Hanya baris dengan fdc_search_query yang dicek.
- Limit default FDC: 1.000 request/jam per IP.
- Periksa manual hasil pencarian: item teratas FDC belum tentu item yang paling cocok.
"""
import csv, json, os, time, urllib.parse, urllib.request

KEY = os.environ.get("FDC_API_KEY")
if not KEY:
    raise SystemExit("Set FDC_API_KEY terlebih dahulu")

NUTRIENTS = {"255": "water", "269": "sugar", "262": "caffeine"}  # nomor nutrien FDC
TOLERANCE = 0.10  # selisih relatif 10%

def search(q):
    params = urllib.parse.urlencode({
        "query": q, "pageSize": 1, "api_key": KEY,
        "dataType": "Foundation,SR Legacy,Survey (FNDDS)",
    })
    with urllib.request.urlopen(f"https://api.nal.usda.gov/fdc/v1/foods/search?{params}", timeout=30) as r:
        foods = json.load(r).get("foods", [])
    if not foods:
        return None
    f = foods[0]
    vals = {v: None for v in NUTRIENTS.values()}
    for n in f.get("foodNutrients", []):
        key = NUTRIENTS.get(str(n.get("nutrientNumber")))
        if key:
            vals[key] = n.get("value")
    return f.get("fdcId"), f.get("description"), vals

def diff(a, b):
    if a is None or b is None:
        return ""
    if b == 0:
        return "" if a == 0 else "CHECK"
    return "CHECK" if abs(a - b) / b > TOLERANCE else "ok"

data = json.load(open("drinks.json", encoding="utf-8"))
out = []
for d in data["drinks"]:
    q = d.get("fdc_search_query")
    if not q:
        continue
    res = search(q)
    time.sleep(0.4)
    if not res:
        out.append({"id": d["id"], "query": q, "fdc_id": "", "fdc_description": "NOT FOUND"})
        continue
    fid, desc, v = res
    out.append({
        "id": d["id"], "query": q, "fdc_id": fid, "fdc_description": desc,
        "db_water": d["water_pct"], "fdc_water": v["water"], "water_check": diff(d["water_pct"], v["water"]),
        "db_sugar": d["sugar_g_per_100ml"], "fdc_sugar": v["sugar"], "sugar_check": diff(d["sugar_g_per_100ml"], v["sugar"]),
        "db_caffeine": d["caffeine_mg_per_100ml"], "fdc_caffeine": v["caffeine"], "caffeine_check": diff(d["caffeine_mg_per_100ml"], v["caffeine"]),
    })
    print(d["id"], "->", desc)

fields = ["id","query","fdc_id","fdc_description","db_water","fdc_water","water_check",
          "db_sugar","fdc_sugar","sugar_check","db_caffeine","fdc_caffeine","caffeine_check"]
with open("fdc_report.csv", "w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=fields)
    w.writeheader()
    w.writerows(out)
print(f"Selesai: {len(out)} item dicek -> fdc_report.csv")
