import 'package:aknperpus/models/cart_model.dart';
import 'package:aknperpus/services/booking_service.dart';
import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  Future<bool> booking(String token, List<CartModel> carts,
      DateTime tanggalPinjam, DateTime tanggalKembali, int durasiPinjam) async {
    try {
      if (await BookingService()
          .booking(token, carts, tanggalPinjam, tanggalKembali, durasiPinjam)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
