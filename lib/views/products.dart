import 'package:flutter/material.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/inputs/search_input.dart';
import 'package:food_app/widgets/products/product_list.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    String searchTerm = "";
    List<Product> products = [];

    return SafeArea(
      top: true,
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: SearchInput(
                  initialValue: searchTerm,
                  onChange: (value) {
                    print(value);
                  },
                  onSubmit: (value) {
                    print(value);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Text(
                  "Popular Today",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colorPrimary,
                  ),
                ),
              ),
              ProductList(
                searchTerm: searchTerm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
