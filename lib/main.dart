import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/screens/cart_screen.dart';
import 'package:catalog_app/screens/home_screen.dart';
import 'package:catalog_app/screens/login_screen.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      routes: {
        "/": (context) => const HomeScreen(),
        MyRoutes.homeRoute: (context) => const HomeScreen(),
        MyRoutes.loginRoute: (context) => const LoginScreen(),
        MyRoutes.cartRoute: (context) => const CartPage()
      },
    );
  }
}
