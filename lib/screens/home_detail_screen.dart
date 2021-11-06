import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$ ${catalog.price}".text.red500.bold.xl3.make(),
            AddToCartButton(catalog: catalog),
          ],
        ).px16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text.xl
                            .color(MyTheme.darkBluishColor)
                            .textStyle(context.captionStyle!)
                            .make(),
                        "Sed clita amet dolore sanctus dolor tempor vero, dolore est et tempor et, duo et lorem ipsum eirmod, dolores ipsum duo magna kasd et invidunt est. Dolor invidunt sed sanctus lorem consetetur eirmod eirmod ut et, diam nonumy nonumy sanctus tempor takimata takimata sed duo invidunt, voluptua sea sed ipsum."
                            .text
                            .make()
                            .p16(),
                      ],
                    ).py(50),
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
