# pemrograman_mobile
- Nama: Hifna Wardatun Nazwa
- Kelas: SIB 3e
- NIM: 2341760097
-
- Note: Mohon maaf pak, saya upload di repo baru, akan segera saya salin🙏.
- Link: https://github.com/hifnazwa/Expense-Manager_Pemrograman-Mobile


# 📚 Book Wishlist & Expense Tracker

Aplikasi untuk mengelola wishlist buku, tabungan khusus buku, dan pengeluaran secara terstruktur.  
Semua data tersimpan lokal sehingga bisa digunakan offline.

---

## 1. Fitur Wishlist

- Tambah buku ke wishlist dengan:
    - Judul
    - Penulis
    - Harga
- Setiap item menampilkan:
    - Progress tabungan terhadap harga buku
    - Status buku: bisa dibeli atau belum
- Edit dan hapus item kapan saja
- Tombol **"Beli Sekarang"** untuk membeli langsung dari tabungan atau saldo utama

---

## 2. Tabungan Wishlist & Saldo Utama

- **Tabungan Wishlist**: khusus untuk membeli buku dari wishlist
    - Progress ditampilkan secara visual dengan LinearProgressIndicator
- **Saldo Utama**: bisa digunakan jika tabungan wishlist tidak cukup
- Integrasi otomatis dengan Expense Tracker untuk mencatat transaksi

---

## 3. Alur Logika “Beli Sekarang”

1. Klik tombol "Beli Sekarang" pada item wishlist
2. Sistem cek saldo tabungan:
    - ✅ **Tabungan cukup**:
        - Kurangi saldo tabungan sesuai harga buku
        - Catat transaksi di ExpenseService:
            - category: "Beli [Judul Buku]"
            - amount: harga buku
            - date: tanggal pembelian
    - ❌ **Tabungan kurang**:
        - Tampilkan dialog: "Gunakan saldo utama?"
        - Jika pilih **Ya**:
            - Ambil sisa kekurangan dari saldo utama
            - Catat transaksi di ExpenseService:
                - category: "Beli [Judul Buku] dengan saldo utama"
                - amount: total biaya
                - date: tanggal pembelian
            - Update saldo utama dan tabungan wishlist
        - Jika pilih **Tidak**:
            - Transaksi batal, saldo tidak berubah

---

## 4. Expense Tracker

- Semua pengeluaran dan penambahan tabungan dicatat otomatis
- Fitur:
    - Menampilkan riwayat transaksi
    - Menampilkan total pengeluaran
    - Menampilkan total tabungan

---

## 5. Status Buku
- Belum mulai 🕮 → Buku baru yang belum dibaca
- Baca 📖 → Sedang dibaca, progress halaman bisa diupdate
- Selesai 🎉 → Buku telah selesai dibaca

---
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
