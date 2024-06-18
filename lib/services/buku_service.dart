import 'dart:convert';
import 'package:aknperpus/config.dart';
import 'package:aknperpus/models/buku_model.dart';
import 'package:http/http.dart' as http;

class BukuService {
  Future<List<BukuModel>> getBukus() async {
    var url = Uri.parse('${AppConfig.baseUrl}/books');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(
      url, 
      headers: headers
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<BukuModel> bukus = [];

      for (var item in data) {
        bukus.add(BukuModel.fromJson(item));
      }

      return bukus;
    } else {
      throw Exception('Gagal Get Mobil!');
    }
  }
}
