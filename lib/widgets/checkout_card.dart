import 'package:aknperpus/models/cart_model.dart';
import 'package:aknperpus/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:aknperpus/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutCard extends StatelessWidget {
  CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    // ubah ip address local disini (sesuaikan dengan ip address saat di ipconfig)
    String baseurl = 'http://192.168.0.105:8000';
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  '${baseurl}/storage/posts/${cart.buku.file}',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cart.buku.judul}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 22,
                ),
                Text(
                  '${cart.buku.penerbit}',
                  style: priceTextStyle,
                ),
                Text(
                  'Kategori : ${cart.buku.kategori?.nama}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: semiBold),
                ),
                Text(
                  'Lokasi : ${cart.buku.rak?.nama}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: semiBold),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Tanggal Pinjam',
          //       style: primaryTextStyle.copyWith(
          //           fontSize: 12, fontWeight: semiBold),
          //     ),
          //     Text(
          //       DateFormat('yyyy-MM-dd').format(cartProvider.tglKembali),
          //       style: primaryTextStyle.copyWith(
          //         fontWeight: semiBold,
          //       ),
          //     ),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Tanggal Kembali',
          //       style: primaryTextStyle.copyWith(
          //           fontSize: 12, fontWeight: semiBold),
          //     ),
          //     Text(
          //       DateFormat('yyyy-MM-dd').format(cartProvider.tglKembali),
          //       style: primaryTextStyle.copyWith(
          //         fontWeight: semiBold,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
