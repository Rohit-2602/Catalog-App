import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog.dart';

class MyStore extends VxStore {
  final CatalogModel catalog = CatalogModel();
  final CartModel cart = CartModel();
}
