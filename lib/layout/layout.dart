import 'package:flutter/material.dart';
import 'package:food_app/layout/appbar/custom_appbar.dart';
import 'package:food_app/layout/tabbar/tabbar.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
int DEFAULT_DURATION = 300;

class Layout extends StatefulWidget {
  final Widget child;
  Layout({Key key, this.child}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool hasCart = true;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: colorBackground,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            top: 0,
            width: MediaQuery.of(context).size.width,
            height: getContainerHeight(context, cartProvider.hasProducts()),
            duration: Duration(milliseconds: DEFAULT_DURATION),
            child: AnimatedContainer(
              duration: Duration(milliseconds: DEFAULT_DURATION),
              width: MediaQuery.of(context).size.width,
              height: getContainerHeight(context, cartProvider.hasProducts()),
              decoration: BoxDecoration(
                color: colorBackground,
                borderRadius: getBorderRadius(cartProvider.hasProducts()),
                boxShadow: [
                  BoxShadow(
                    color: colorPrimary.withOpacity(.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
          // Header appbar
          AnimatedPositioned(
            left: 0,
            top: 0,
            child: CustomAppbar(),
            duration: Duration(
              milliseconds: 500,
            ),
          ),
          // Footer tabbar
          AnimatedPositioned(
            bottom: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: 60,
            duration: Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  ),
              child: Tabbar(
                cart: cartProvider.cart,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar(BuildContext context, Cart cart) {
    return Text('content');
  }

  getContainerHeight(context, hasProducts) {
    double height = MediaQuery.of(context).size.height;
    if (hasProducts) return height - 60;
    return height;
  }

  BorderRadius getBorderRadius(hasProducts) {
    if (hasProducts)
      return BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      );
    return null;
  }
}
