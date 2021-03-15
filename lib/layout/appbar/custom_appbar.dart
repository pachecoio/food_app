import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';

class CustomAppbar extends StatefulWidget {
  final Function onPressed;
  CustomAppbar({Key key, this.onPressed}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: widget.onPressed,
            icon: Icon(
              Icons.menu,
              color: colorGrey,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: colorGrey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://res.cloudinary.com/simplecoder/image/upload/v1614559500/portfolio/WhatsApp_Image_2021-02-28_at_7.43.02_PM.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
