import 'package:aknperpus/models/kategori_model.dart';
import 'package:aknperpus/models/rak_model.dart';

class TransaksiModel {
  int? id;
  String? tglPinjam;
  String? tglKembali;
  int? durasiPinjam;
  KategoriModel? kategori;
  RakModel? rak;

  TransaksiModel({
    this.id,
    this.tglPinjam,
    this.tglKembali,
    this.durasiPinjam,
    this.kategori,
    this.rak,
  });

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tglPinjam = json['tgl_pinjam'];
    tglKembali = json['tgl_kembali'];
    durasiPinjam = int.parse(json['durasi_pinjam'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tgl_pinjam': tglPinjam,
      'tgl_kembali': tglKembali,
      'durasi_pinjam': durasiPinjam,
    };
  }
}

class UninitializedTransaksiModel extends TransaksiModel {}
