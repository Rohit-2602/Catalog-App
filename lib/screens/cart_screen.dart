import 'package:catalog_app/widgets/cart_widget/cart_button_bar.dart';
import 'package:catalog_app/widgets/cart_widget/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          const CartList().expand(),
          const CartButtonBar().px16(),
        ],
      ),
    );
  }
}