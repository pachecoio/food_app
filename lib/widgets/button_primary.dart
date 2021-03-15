import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function onTap;
  const ButtonPrimary({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          color: colorHighlight,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Text(
                text,
                style: TextStyle(
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
