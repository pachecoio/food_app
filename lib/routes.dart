import 'package:food_app/layout/layout.dart';
import 'package:food_app/views/product_details.dart';
import 'package:food_app/views/products.dart';

var routes = {
  "/": (context) => Layout(
        child: Products(),
      ),
  "/product/details": (context) => ProductDetails(),
};
