import 'package:aknperpus/models/buku_model.dart';
import 'package:aknperpus/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _carts = [];
  DateTime _tglKembali = DateTime.now();
  DateTime _tglPinjam = DateTime.now();

  List<CartModel> get carts => _carts;
  DateTime get tglKembali => _tglKembali;
  DateTime get tglPinjam => _tglPinjam;
  int get durasiPinjam {
    return _tglKembali.difference(_tglPinjam).inDays;
  }

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  setTglKembali(DateTime date) {
    _tglKembali = date;
    notifyListeners();
  }

  setTglPinjam(DateTime date) {
    _tglPinjam = date;
    notifyListeners();
  }

  addCart(BukuModel buku) {
    if (bukuExist(buku)) {
      int index =
          _carts.indexWhere((element) => element.buku.id == buku.id);
      _carts[index].qty++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          buku: buku,
          qty: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(BukuModel buku) {
    int index = _carts.indexWhere(
      (element) => element.buku.id == buku.id,
    );
    _carts.removeAt(index);
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.qty;
    }
    return total;
  }

  bukuExist(BukuModel buku) {
    if (_carts.indexWhere((element) => element.buku.id == buku.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
