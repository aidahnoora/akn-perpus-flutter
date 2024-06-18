import 'package:aknperpus/models/buku_model.dart';
import 'package:aknperpus/services/buku_service.dart';
import 'package:flutter/material.dart';

class BukuProvider with ChangeNotifier {
  List<BukuModel> _bukus = [];

  List<BukuModel> get bukus => _bukus;

  set bukus(List<BukuModel> bukus) {
    _bukus = bukus;
    notifyListeners();
  }

  Future<void> getBukus() async {
    try {
      List<BukuModel> bukus = await BukuService().getBukus();
      _bukus = bukus;
    } catch (e) {
      print(e);
    }
  }

}
