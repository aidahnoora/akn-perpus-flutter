import 'package:aknperpus/providers/buku_provider.dart';
import 'package:flutter/material.dart';
import 'package:aknperpus/theme.dart';
import 'package:aknperpus/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  String? searchText;

  @override
  Widget build(BuildContext context) {
    BukuProvider bukuProvider = Provider.of<BukuProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Katalog Buku',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget libraryImage() {
      return Container(
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image_library.png'), // Ubah dengan path gambar header Anda
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        color: backgroundColor3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari ...',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryTextColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: primaryTextStyle,
                        onChanged: (value) {
                          searchText =
                              value; // Update nilai searchText saat teks berubah
                          bukuProvider
                              .notifyListeners(); // Panggil notifyListeners() untuk update tampilan
                        },
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: primaryTextColor,
                      ),
                      onPressed: () {
                        // Menerapkan logika pencarian
                        bukuProvider.bukus = bukuProvider.bukus
                            .where((buku) =>
                                searchText == null || searchText!.isEmpty
                                    ? true
                                    : buku.judul!
                                        .toLowerCase()
                                        .contains(searchText!.toLowerCase()))
                            .toList();
                        bukuProvider.notifyListeners();
                      }),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: bukuProvider.bukus
                    .where((buku) => searchText == null || searchText!.isEmpty
                        ? true
                        : buku.judul!
                            .toLowerCase()
                            .contains(searchText!.toLowerCase()))
                    .map((buku) {
                  return ProductCard(buku);
                }).toList(),
              ),
            ),
            SizedBox(
              height: defaultMargin,
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          libraryImage(),
          popularProducts(),
        ],
      ),
    );
  }
}
