import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.bold.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.done),
                title: _cart.items[index].name.text.make(),
                trailing: InkWell(
                    onTap: () {
                      RemoveMutation(_cart.items[index]);
                      // setState(() {});
                    },
                    child: const Icon(Icons.remove_circle_outline_rounded)),
              ).px12();
            });
  }
}
