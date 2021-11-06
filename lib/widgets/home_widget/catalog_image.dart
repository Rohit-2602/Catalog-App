import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';

class CatalogImage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final catalog;
  const CatalogImage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalog.image)
        .box
        .color(MyTheme.creamColor)
        .rounded
        .p12
        .make()
        .w(130)
        .p(10);
  }
}