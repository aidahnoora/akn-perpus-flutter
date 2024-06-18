import 'package:aknperpus/models/kategori_model.dart';
import 'package:aknperpus/models/rak_model.dart';

class BukuModel {
  int? id;
  String? kode;
  String? judul;
  String? deskripsi;
  double? stok;
  String? penerbit;
  String? file;
  KategoriModel? kategori;
  RakModel? rak;
  DateTime? createdAt;
  DateTime? updatedAt;

  BukuModel({
    this.id,
    this.kode,
    this.judul,
    this.deskripsi,
    this.stok,
    this.penerbit,
    this.file,
    this.kategori,
    this.rak,
    this.createdAt,
    this.updatedAt,
  });

  BukuModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kode = json['kode'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    stok = double.parse(json['stok'].toString());
    penerbit = json['penerbit'];
    file = json['file'];
    kategori = KategoriModel.fromJson(json['kategori']);
    rak = RakModel.fromJson(json['rak']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode': kode,
      'judul': judul,
      'deskripsi': deskripsi,
      'stok': stok,
      'penerbit': penerbit,
      'file': file,
      'kategori': kategori?.toJson(),
      'rak': rak?.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedBukuModel extends BukuModel {}
