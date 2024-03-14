# TP1PROVIS2024C1

## OOP
![DIAGRAM TP1 Provis (1)](https://github.com/boyaditya/TP1PROVIS2024C1/assets/135103722/13a6abe5-1454-4e9c-a554-5494b922b697)


### Kelas Pesanan:
Atribut:
- _id: Integer, ID unik untuk setiap pesanan (digenerate secara otomatis)
- _daftarItem: List of ItemMenu, daftar item yang dipesan
- _hargaTotal: Integer, total harga pesanan
- _status: StatusPesanan, status pemesanan (menunggu, sedang dimasak, selesai)
  
Method:
- hitungHargaTotal: Menghitung total harga pesanan
- tampilkanDetail: Menampilkan detail pemesanan, termasuk daftar item, pajak, dan harga
  
### Kelas Pelanggan:
Atribut:
- _nama: String, nama pelanggan
- _daftarPesanan: List of Pesanan, daftar pesanan yang dibuat oleh pelanggan
  
Method:
- pesan: Menambahkan pesanan baru ke daftar pesanan
  
### Kelas Menu:
Atribut:
- _daftarItem: List of ItemMenu, daftar item menu yang tersedia
  
### Kelas ItemMenu:
Atribut:
- _id: Integer, ID unik untuk setiap item menu
- _nama: String, nama item menu
- _harga: Integer, harga item menu

### Kelas-kelas Turunan:
- Noodle: Kelas turunan dari ItemMenu, memiliki atribut tambahan _level (tingkat kepedasan)
- Dimsum: Kelas turunan dari ItemMenu
- Beverage: Kelas turunan dari ItemMenu, memiliki atribut tambahan _isCold (menunjukkan apakah minuman dingin atau panas)
  
### Hubungan Antar Kelas:
- Pesanan memiliki hubungan komposisi dengan ItemMenu: Sebuah Pesanan terdiri dari beberapa ItemMenu.
- Pelanggan memiliki hubungan komposisi dengan Pesanan: Seorang Pelanggan memiliki beberapa Pesanan.
- Menu memiliki hubungan agregasi dengan ItemMenu: Sebuah Menu berisi beberapa ItemMenu.

## Asynchronus
**Simulasi Pemesanan Makanan:**

* `Future.delayed` menyimulasikan waktu penyiapan (2 detik) dan memasak (5 detik).
* Kode lain di `main` dapat dieksekusi saat simulasi berlangsung (contoh: tampilkan detail pesanan).
* Ketika simulasi selesai, status pesanan diubah.

**Menunggu Selesainya Pesanan:**

* `while` loop menunggu hingga semua pesanan selesai.
* Program menunggu 5 detik dan memeriksa kembali status pesanan.
* Ketika semua pesanan selesai, loop `while` berhenti dan menampilkan pesan "Semua pesanan selesai!".
