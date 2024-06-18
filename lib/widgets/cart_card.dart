import 'package:aknperpus/models/cart_model.dart';
import 'package:aknperpus/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:aknperpus/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  // void initState() {
  //   super.initState();
  // }

  // Future<void> _selectDate(BuildContext context, DateTime initialDate,
  //     Function(DateTime) onDateSelected) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != initialDate)
  //     setState(() {
  //       onDateSelected(picked);
  //     });
  // }

  Widget build(BuildContext context) {
    String baseurl = 'http://192.168.0.105:8000';

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    // int durasiPinjam = cartProvider.tglKembali.difference(cartProvider.tglPinjam).inDays;

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${baseurl}/storage/posts/${widget.cart.buku.judul}'),
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
                      '${widget.cart.buku.kategori?.nama}',
                      style: primaryTextStyle,
                    ),
                    Text(
                      '${widget.cart.buku}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '${widget.cart.buku.penerbit}',
                      style: priceTextStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Tanggal Pinjam',
                    //       style: primaryTextStyle,
                    //     ),
                    //     GestureDetector(
                    //       onTap: () => _selectDate(
                    //           context,
                    //           cartProvider.tglPinjam,
                    //           (date) => cartProvider.setTglPinjam(date)),
                    //       child: Text(
                    //           DateFormat('yyyy-MM-dd')
                    //               .format(cartProvider.tglPinjam),
                    //           style: priceTextStyle),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Tanggal Kembali',
                    //       style: primaryTextStyle,
                    //     ),
                    //     GestureDetector(
                    //       onTap: () => _selectDate(
                    //           context,
                    //           cartProvider.tglKembali,
                    //           (date) => cartProvider.setTglKembali(date)),
                    //       child: Text(
                    //           DateFormat('yyyy-MM-dd')
                    //               .format(cartProvider.tglKembali),
                    //           style: priceTextStyle),
                    //     ),
                    //   ],
                    // ),
                    
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(widget.cart.buku);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_remove.png',
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
