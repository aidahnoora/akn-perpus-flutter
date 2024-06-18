import 'package:aknperpus/pages/home/wishlist_page.dart';
import 'package:aknperpus/providers/auth_provider.dart';
import 'package:aknperpus/providers/booking_provider.dart';
import 'package:aknperpus/providers/buku_provider.dart';
import 'package:aknperpus/providers/cart_provider.dart';
import 'package:aknperpus/providers/transaksi_provider.dart';
import 'package:flutter/material.dart';
import 'package:aknperpus/pages/cart_page.dart';
import 'package:aknperpus/pages/checkout_page.dart';
import 'package:aknperpus/pages/checkout_success_page.dart';
import 'package:aknperpus/pages/detail_chat_page.dart';
import 'package:aknperpus/pages/edit_profile_page.dart';
import 'package:aknperpus/pages/home/main_page.dart';
import 'package:aknperpus/pages/product_page.dart';
import 'package:aknperpus/pages/sign_in_page.dart';
import 'package:aknperpus/pages/sign_up_page.dart';
import 'package:aknperpus/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BukuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          // '/product': (context) => const ProductPage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}