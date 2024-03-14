// Tugas Praktikum 1
// NIM : 2203488
// Nama : Boy Aditya Rohmaulana
// Kelas : C1

import 'dart:async';

// ------- Class Pesanan --------
class Pesanan {
  int _id = -1;
  List<ItemMenu> _daftarItem;
  int _hargaTotal = -1;
  StatusPesanan _status = StatusPesanan.menunggu;

  // constructor
  Pesanan(this._daftarItem) {
    _id = _generateId();
    _hitungHargaTotal();

    // Simulasi waktu penyiapan
    Future.delayed(Duration(seconds: 2), () {
      _status = StatusPesanan.sedangDimasak;
      print("Pesanan ${_id} sedang dimasak!");
    });
  }

  // Getter
  int get id => _id;
  List<ItemMenu> get daftarItem => _daftarItem;
  int get hargaTotal => _hargaTotal;
  StatusPesanan get status => _status;

  // Setter
  set daftarItem(List<ItemMenu> value) {
    _daftarItem = value;
    _hitungHargaTotal(); // Update harga total setelah mengubah daftar item
  }

  set status(StatusPesanan value) {
    _status = value;
  }

  // Method
  void _hitungHargaTotal() {
    _hargaTotal = 0;
    for (ItemMenu item in _daftarItem) {
      _hargaTotal += item.harga;
    }
    // pajak
    _hargaTotal = (_hargaTotal / 10).ceil() + _hargaTotal;
  }

  int _generateId() {
    // Implementasi untuk generate ID unik
    var now = DateTime.now();
    return now.second + now.millisecond;
  }

  void tampilkanDetail() {
    print("Pesanan ${this.id}:");

    for (ItemMenu item in this.daftarItem) {
      if (item is Noodle) {
        print("${item.nama} LV ${item.level}    Rp${item.harga}");
      } else if (item is Beverage) {
        print(
            "${item.nama} ${item.isCold == true ? "COLD" : "HOT"}    Rp${item.harga}");
      } else {
        print("${item.nama}     Rp${item.harga}");
      }
    }

    print("-----------------------------------");
    print(
        "Sub Total    : Rp${this.daftarItem.fold(0, (total, item) => total + item.harga)}");
    print(
        "Pajak 10%    : Rp${this.hargaTotal - this.daftarItem.fold(0, (total, item) => total + item.harga)}");
    print("Total Bill   : Rp${this.hargaTotal}");
    print("");
  }
}

enum StatusPesanan {
  menunggu,
  sedangDimasak,
  selesai,
}

// ------- Class Pelanggan --------
class Pelanggan {
  String _nama;
  List<Pesanan> _daftarPesanan;

  // Constructor
  Pelanggan(this._nama, this._daftarPesanan);

  // Getter
  String get nama => _nama;
  List<Pesanan> get daftarPesanan => _daftarPesanan;

  // Setter
  set nama(String value) {
    _nama = value;
  }

  set daftarPesanan(List<Pesanan> value) {
    _daftarPesanan = value;
  }

  // Method
  void pesan(List<ItemMenu> item) {
    Pesanan pesanan = Pesanan(item);
    _daftarPesanan.add(pesanan);

    // Simulasi waktu memasak
    Future.delayed(Duration(seconds: 5), () {
      pesanan.status = StatusPesanan.selesai;
      print("Pesanan ${pesanan.id} untuk $_nama selesai!");
    });
  }
}

// ------- Class Menu --------
class Menu {
  List<ItemMenu> _daftarItem;

  // Constructor
  Menu(this._daftarItem);

  // Getter
  List<ItemMenu> get daftarItem => _daftarItem;

  // Setter
  set daftarItem(List<ItemMenu> value) {
    _daftarItem = value;
  }

  // Method
  void tampilkan() {
    print("Menu:");
    for (ItemMenu item in _daftarItem) {
      if (item is Noodle) {
        print("${item.id}. ${item.nama}, LV ${item.level} - Rp${item.harga}");
      } else {
        print("${item.id}. ${item.nama} - Rp${item.harga}");
      }
    }
    print("");
  }
}

// ------- Class ItemMenu --------
class ItemMenu {
  int _id;
  String _nama;
  int _harga;

  // Constructor
  ItemMenu(this._id, this._nama, this._harga);

  // Getter
  int get id => _id;
  String get nama => _nama;
  int get harga => _harga;

  // Setter
  set id(int value) {
    _id = value;
  }

  set nama(String value) {
    _nama = value;
  }

  set harga(int value) {
    _harga = value;
  }
}

// ------- Class Noodle --------
class Noodle extends ItemMenu {
  int _level;

  Noodle(int id, String nama, int harga, this._level) : super(id, nama, harga);

  // Getter
  int get level => _level;

  // Setter
  set level(int value) {
    _level = value;
  }
}

// ------- Class Dimsum --------
class Dimsum extends ItemMenu {
  Dimsum(int id, String nama, int harga) : super(id, nama, harga);
}

// ------- Class Beverage --------
class Beverage extends ItemMenu {
  bool _isCold;

  Beverage(int id, String nama, int harga, this._isCold)
      : super(id, nama, harga);

  // Getter
  bool get isCold => _isCold;

  // Setter
  set isCold(bool value) {
    _isCold = value;
  }
}

void main() async {
  // Buat menu
  Menu menu = Menu([
    Noodle(1, "MIE GOCAON", 9500, 0),
    Noodle(2, "MIE GOCAON", 9500, 1),
    Noodle(3, "MIE GOCAON", 9500, 2),
    Noodle(4, "MIE GOCAON", 9500, 3),
    Noodle(5, "MIE GOCAON", 9500, 4),
    Noodle(6, "MIE GOCAON", 10500, 6),
    Noodle(7, "MIE GOCAON", 10500, 8),
    Noodle(8, "MIE POMPIMHA", 9500, 1),
    Noodle(9, "MIE POMPIMHA", 9500, 2),
    Noodle(10, "MIE POMPIMHA", 9500, 3),
    Noodle(11, "MIE POMPIMHA", 9500, 4),
    Noodle(12, "MIE POMPIMHA", 10500, 6),
    Noodle(13, "MIE POMPIMHA", 10500, 8),
    Dimsum(14, "SIOMAY", 8600),
    Dimsum(15, "UDANG RAMBUTAN", 8600),
    Dimsum(16, "UDANG KEJU", 8600),
    Dimsum(17, "LUMPIA UDANG", 8600),
    Dimsum(18, "PANGSIT GORENG", 9500),
    Beverage(19, "ES GOBAK SODOR", 8600, true),
    Beverage(20, "ES TEKLEK", 5900, true),
    Beverage(21, "ES SLUKU BATHOK", 5900, true),
    Beverage(22, "ES PETAK UMPET", 8600, true),
    Beverage(23, "LEMON TEA", 5900, false),
    Beverage(24, "MILO", 7700, true),
  ]);

  // Tampilkan menu
  menu.tampilkan();

  // Buat pelanggan
  Pelanggan pelanggan1 = Pelanggan("Boy Aditya", []);

  // Pesan makanan
  pelanggan1
      .pesan([menu.daftarItem[3], menu.daftarItem[15], menu.daftarItem[23]]);

  pelanggan1.daftarPesanan.forEach((pesanan) {
    pesanan.tampilkanDetail();
  });

  // Tunggu hingga semua pesanan selesai
  while (pelanggan1.daftarPesanan
      .any((pesanan) => pesanan.status != StatusPesanan.selesai)) {
    await Future.delayed(Duration(seconds: 5));
  }

  print("Semua pesanan selesai!");
}
