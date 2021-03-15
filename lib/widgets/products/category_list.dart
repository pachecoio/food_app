import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //  child: ListView.builder(
      //    scrollDirection: Axis.horizontal,
      //    itemCount: ,
      //  ),
    );
  }
}
