import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';

class QuantityButton extends StatefulWidget {
  final int initialValue;
  final Function onChange;
  QuantityButton({Key key, this.initialValue, this.onChange})
      : super(key: key);

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: EdgeInsets.symmetric(
        // vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: colorBackgroundLight,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: decrement,
            child: Text(
              "-",
              style: TextStyle(
                color: colorGrey,
                fontSize: 50,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Text(
            "$value",
            style: TextStyle(
              color: colorPrimary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: increment,
            child: Text(
              "+",
              style: TextStyle(
                color: colorGrey,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  decrement() {
    setState(() {
      value--;
    });
    widget.onChange(value);
  }

  increment() {
    setState(() {
      value++;
    });
    widget.onChange(value);
  }
}
