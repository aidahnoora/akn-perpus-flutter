import 'dart:convert';
import 'package:aknperpus/config.dart';
import 'package:aknperpus/models/cart_model.dart';
import 'package:http/http.dart' as http;

class BookingService {
  Future<bool> booking(String token, List<CartModel> carts,
      DateTime tanggalPinjam, DateTime tanggalKembali, int durasiPinjam) async {
    var url = Uri.parse('${AppConfig.baseUrl}/booking');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    // Format tanggal
    String formatTanggal(DateTime date) {
      return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
    }

    var body = jsonEncode(
      {
        'tgl_pinjam': formatTanggal(tanggalPinjam ?? DateTime.now()),
        'tgl_kembali': formatTanggal(tanggalKembali ?? DateTime.now()),
        'durasi_pinjam': durasiPinjam ?? 0,
        'items': carts
            .map(
              (cart) => {
                'id': cart.buku.id,
                'qty': cart.qty,
              },
            )
            .toList(),
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan booking!');
    }
  }
}
