# 📚 BookFinder — Aplikasi Katalog & Pencarian Buku Digital

> **Tugas Ujian Tengah Semester (UTS) — Pemrograman Mobile (Teori Kelas A)**  
> **Nama:** Nadia Tria Almuqoffa  
> **NIM:** 240605110136  
> **Program Studi:** Teknik Informatika  
> **Universitas:** UIN Maulana Malik Ibrahim Malang  
> **Dosen Pengampu:** Tri Mukti Lestari, M.Kom.  

---

## 📖 Deskripsi Aplikasi
**BookFinder** adalah aplikasi mobile berbasis **Flutter & Dart** yang dirancang sebagai katalog digital untuk mencari dan mengeksplorasi jutaan koleksi buku secara *real-time*. Data buku diambil secara dinamis dari **Open Library API** publik tanpa memerlukan API key.

Aplikasi ini mengusung konsep antarmuka **Modern Minimalist Bookstore** dengan nuansa warna hangat, tipografi yang nyaman dibaca, serta navigasi yang responsif dan terintegrasi antarhalaman.

---

## ✨ Fitur Utama
Aplikasi ini memiliki 3 halaman (*page/route*) utama yang saling terhubung:

1. **Home Page (Beranda)**
   - Header aplikasi dengan branding BookFinder.
   - Banner unggulan *Discovery of the Day* dengan gradasi warna elegan.
   - *Search Bar* interaktif untuk input pencarian cepat.
   - Pilihan kategori populer (*Fiction, Science, History, Fantasy, Flutter, Programming*) dengan ikon representatif.
   - Seksi *Explore Books* yang menyajikan buku rekomendasi dalam tata letak kartu grid.
   - Indikator *Loading* dan tombol *Retry* saat koneksi bermasalah.

2. **Search Results Page (Hasil Pencarian)**
   - Menampilkan daftar buku dinamis dari Open Library API berdasarkan kata kunci.
   - Format tampilan grid dua kolom (*2-column responsive grid*).
   - Menampilkan sampul buku (*book cover*), judul, nama penulis, dan tahun pertama kali diterbitkan.
   - Penanganan status komprehensif: *Loading State*, *Empty State* (jika buku tidak ditemukan), dan *Error State*.

3. **Book Details Page (Detail Buku)**
   - Sampul buku berukuran besar dengan animasi transisi **Hero Animation**.
   - Judul buku, penulis, tahun publikasi, dan penerbit.
   - Deskripsi lengkap atau sinopsis buku yang diambil secara asinkron dari endpoint *Works* Open Library.
   - Tombol kembali di AppBar untuk navigasi yang mulus.

---

## 🎨 Konsep Desain & Palet Warna
Desain mengacu pada gaya *Modern Minimalist Bookstore*:
- **Background Utama:** `#FAF7F0` (Krem lembut ala kertas buku)
- **Warna Utama (Primary):** `#6B4226` (Cokelat tua elegan)
- **Warna Aksen:** `#D99A55` (Oranye hangat)
- **Warna Kartu / Surface:** `#FFFFFF` (Putih bersih)
- **Teks Utama:** `#292521` (Arang gelap / kontras tinggi)
- **Teks Sekunder:** `#81786E` (Abu-abu kecokelatan)
- **Border / Garis Tepi:** `#EAE3D8`

---

## 🌐 Endpoint API yang Digunakan
Data diambil secara *real-time* dari **Open Library API**:
1. **Pencarian Buku:**
   `https://openlibrary.org/search.json?q={query}&limit=20`
2. **Detail Karya / Deskripsi:**
   `https://openlibrary.org/works/{id}.json`
3. **Sampul Buku:**
   `https://covers.openlibrary.org/b/id/{cover_i}-M.jpg`

---

## 🛠️ Teknologi & Package
- **Framework:** Flutter (Dart 3.x)
- **Package Utama:**
  - [`http`](https://pub.dev/packages/http): Mengirim HTTP request asynchronous ke Open Library API.
- **Konsep Flutter:**
  - `FutureBuilder` untuk konsumsi data API dinamis.
  - `Hero Widget` untuk animasi transisi gambar sampul buku.
  - `GridView.builder` & `SingleChildScrollView` untuk antarmuka responsif.

---

## 📂 Struktur Direktori Project
```text
lib/
├── main.dart                  # Titik masuk utama aplikasi & konfigurasi tema
├── models/
│   └── book.dart              # Model data buku & parser JSON
├── pages/
│   ├── home_page.dart         # Halaman Beranda (Banner, Kategori, Rekomendasi)
│   ├── search_results_page.dart # Halaman Hasil Pencarian Buku
│   └── book_details_page.dart # Halaman Rincian & Sinopsis Buku
├── services/
│   └── open_library_service.dart # Service HTTP client ke Open Library API
└── widgets/
    ├── book_cover.dart        # Komponen gambar sampul dengan placeholder
    ├── book_card.dart         # Komponen kartu buku vertikal
    └── book_grid_card.dart    # Komponen kartu buku format grid
```

---

## 🚀 Cara Menjalankan Project Secara Lokal

1. **Clone repository ini:**
   ```bash
   git clone https://github.com/trianadia/aplikasi-bookfinder-240605110136-uts.git
   cd aplikasi-bookfinder-240605110136-uts/bookfinder
   ```

2. **Unduh dependencies:**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```
