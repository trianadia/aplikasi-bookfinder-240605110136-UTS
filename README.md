# BookFinder

Aplikasi mobile pencarian dan katalog buku sederhana berbasis Flutter yang mengambil data dari Open Library API. Project ini dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile.

### Data Mahasiswa
- **Nama:** Nadia Tria Almuqoffa
- **NIM:** 240605110136
- **Kelas:** Pemrograman Mobile (Teori A)
- **Dosen Pengampu:** Tri Mukti Lestari, M.Kom.
- **Program Studi:** Teknik Informatika, UIN Maulana Malik Ibrahim Malang

---

## Tentang Aplikasi
BookFinder dibuat untuk mempermudah pencarian informasi buku lewat tampilan mobile yang sederhana dan responsif. Pengguna bisa mencari berdasarkan judul atau penulis, memilih kategori bacaan populer, dan membaca detail ringkasan buku.

Semua data (judul, penulis, tahun rilis, cover, dan sinopsis) diambil langsung secara dinamis dari Open Library tanpa memerlukan API key.

## Halaman Aplikasi
Aplikasi ini memiliki 3 halaman yang saling terhubung:
1. **Home:** Halaman utama berisi kolom pencarian, pilihan kategori cepat (Fiction, Science, History, Fantasy, Programming), serta daftar rekomendasi buku dalam tampilan grid.
2. **Search Results:** Halaman hasil pencarian berdasarkan kata kunci yang diketik pengguna, lengkap dengan status loading, pesan ketika buku tidak ditemukan, dan tombol coba lagi jika koneksi gagal.
3. **Book Detail:** Menampilkan informasi lengkap buku yang dipilih, seperti gambar cover besar, judul, penulis, tahun rilis, serta deskripsi atau sinopsis buku.

## API yang Digunakan
Data diambil dari layanan publik Open Library:
- **Pencarian Buku:** `https://openlibrary.org/search.json?q={query}&limit=20`
- **Detail Karya (Sinopsis):** `https://openlibrary.org/works/{id}.json`
- **Gambar Cover:** `https://covers.openlibrary.org/b/id/{cover_id}-M.jpg`

## Struktur Folder
```text
lib/
├── main.dart                  # Entry point dan tema aplikasi
├── models/
│   └── book.dart              # Model data buku dan serialisasi JSON
├── pages/
│   ├── home_page.dart         # Halaman utama / katalog
│   ├── search_results_page.dart # Halaman daftar hasil pencarian
│   └── book_details_page.dart # Halaman detail dan sinopsis buku
├── services/
│   └── open_library_service.dart # Logika HTTP request ke Open Library
└── widgets/
    ├── book_cover.dart        # Widget render gambar sampul
    ├── book_card.dart         # Widget kartu buku tampilan list
    └── book_grid_card.dart    # Widget kartu buku tampilan grid
```

## Cara Menjalankan

1. Clone repositori:
   ```bash
   git clone https://github.com/trianadia/aplikasi-bookfinder-240605110136-uts.git
   cd aplikasi-bookfinder-240605110136-uts/bookfinder
   ```

2. Unduh package / dependency:
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi di emulator atau perangkat fisik:
   ```bash
   flutter run
   ```
