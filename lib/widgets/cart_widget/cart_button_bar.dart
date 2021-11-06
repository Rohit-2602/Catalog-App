import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';

class CartButtonBar extends StatelessWidget {
  const CartButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        VxBuilder<MyStore>(
          mutations: const {RemoveMutation},
          builder: (context, store, status) {
            return "\$ ${_cart.totalPrice}".text.red500.bold.xl3.make();
          },
        ),
        ElevatedButton(
          onPressed: () {},
          child: "Buy".text.make(),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(const StadiumBorder())),
        ),
      ],
    );
  }
}
