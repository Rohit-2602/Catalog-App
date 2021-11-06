import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/screens/home_detail_screen.dart';
import 'package:catalog_app/widgets/add_to_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(
                    catalog: catalog,
                  ),
                ));
          },
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogItem extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  State<CatalogItem> createState() => _CatalogItemState();
}

class _CatalogItemState extends State<CatalogItem> {
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(widget.catalog.id.toString()),
            child: CatalogImage(catalog: widget.catalog)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.catalog.name.text.lg
                .color(MyTheme.darkBluishColor)
                .bold
                .make(),
            10.heightBox,
            widget.catalog.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$ ${widget.catalog.price}".text.bold.xl.make(),
                AddToCartButton(catalog: widget.catalog),
              ],
            ).pOnly(right: 10),
          ],
        )),
      ],
    )).white.rounded.square(130).make().py(10);
  }
}
