import 'package:aknperpus/models/buku_model.dart';

class CartModel {
  int id;
  BukuModel buku;
  int qty;

  CartModel({
    required this.id,
    required this.buku,
    required this.qty,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        buku: BukuModel.fromJson(json['buku']),
        qty: json['qty'],
      );

  DateTime get tglPinjam => DateTime.now();

  DateTime get tglKembali => DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'buku': buku.toJson(),
        'qty': qty,
      };
}

class CartDetail {
  int? durasiPinjam;
  DateTime tglPinjam;
  DateTime tglKembali;

  CartDetail({
    this.durasiPinjam,
    required this.tglPinjam,
    required this.tglKembali,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        durasiPinjam: json['durasi_pinjam'],
        tglPinjam: DateTime.parse(json['tgl_pinjam']),
        tglKembali: DateTime.parse(json['tgl_kembali']),
      );

  Map<String, dynamic> toJson() => {
        'durasi_pinjam': durasiPinjam,
        'tgl_pinjam': tglPinjam.toString(),
        'tgl_kembali': tglKembali.toString(),
      };
}
