import 'package:flutter/material.dart';
import 'package:food_app/food_app_icons.dart';
import 'package:food_app/utils/colors.dart';

class CartButton extends StatelessWidget {
  final Function onTap;
  const CartButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: colorHighlight,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              child: Center(
                child: Icon(
                  FoodApp.bag,
                  color: colorBackground,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
