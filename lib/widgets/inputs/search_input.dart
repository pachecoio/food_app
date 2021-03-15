import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/utils/colors.dart';

import '../../food_app_icons.dart';

class SearchInput extends StatefulWidget {
  final Function onChange;
  final Function onSubmit;
  final String initialValue;
  final String hintText;
  SearchInput({
    Key key,
    this.onChange,
    this.onSubmit,
    this.initialValue = "",
    this.hintText = "Search...",
  }) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.initialValue;
    textController.addListener(_onChange);
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  _onChange() {
    widget.onChange(textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorGreyLight,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            FoodApp.magnifiying_glass,
            color: colorGrey,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 200,
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              style: TextStyle(
                fontSize: 18,
              ),
              onSubmitted: widget.onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
