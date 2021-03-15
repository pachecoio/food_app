import 'package:flutter/material.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/cart_button.dart';

class Tabbar extends StatelessWidget {
  final Cart cart;
  const Tabbar({Key key, this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: getSpacing(),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                ...buildProducts(context),
              ],
            ),
          ),
          CartButton(
            onTap: () {
              print("show cart");
            },
          ),
        ],
      ),
    );
  }

  List<Widget> buildProducts(context) {
    if (cart.hasProducts()) {
      return cart
          .getComputedProducts()
          .entries
          .map(
            (entry) => Container(
              margin: EdgeInsets.only(
                right: 5,
              ),
              child: buildProduct(entry.value),
            ),
          )
          .toList();
    }

    return [];
  }

  Widget buildProduct(Map<String, dynamic> value) {
    Product product = value["products"][0];
    int quantity = value["quantity"];
    return Hero(
      tag: "product_image_cart_${product.id}",
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(product.image),
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print("go to product");
                  },
                ),
              ),
            ),
          ),
          quantity > 1
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: colorPrimary,
                    ),
                    child: Text(
                      quantity.toString(),
                      style: TextStyle(
                        color: colorBackground,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  getSpacing() {
    if (cart.products.length > 0) return MainAxisAlignment.spaceBetween;
    return MainAxisAlignment.center;
  }
}
