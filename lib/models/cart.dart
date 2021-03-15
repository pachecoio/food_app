import 'package:food_app/models/product.dart';

class Cart {
  final List<Product> products;

  Cart({this.products});

  double getTotalPrice() {
    if (products == null || products.length == 0) return 0.0;
    return 0.0;
  }

  bool hasProducts() {
    return products.length > 0;
  }

  Map<String, dynamic> getComputedProducts() {
    if (products == null) return {};
    Map<String, dynamic> computed = {};
    for (Product product in products) {
      String key = product.id.toString();

      if (computed[key] == null)
        computed[key] = {
          "quantity": 0,
          "products": [],
        };

      computed[key]["quantity"]++;
      computed[key]["products"].add(product);
    }
    return computed;
  }
}
