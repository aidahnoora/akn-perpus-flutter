class RakModel {
  int? id;
  String? nama;

  RakModel({
    this.id,
    this.nama,
  });

  RakModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
    };
  }
}
