import 'package:catalog_app/core/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatelessWidget {
  final Item catalog;
  const AddToCartButton({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isAdded = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isAdded) {
          AddMutation(catalog);
        } else {
          RemoveMutation(catalog);
        }
      },
      child: isAdded
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
    );
  }
}
