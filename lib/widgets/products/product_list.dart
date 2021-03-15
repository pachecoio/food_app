import 'package:flutter/material.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/services/product_service.dart';
import 'package:food_app/widgets/products/product_item.dart';

class ProductList extends StatefulWidget {
  final String searchTerm;
  ProductList({Key key, this.searchTerm}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [];
  bool loading = true;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return Container(
        margin: EdgeInsets.only(
          top: 80,
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buildProductList(),
      ),
    );
  }

  getProducts() async {
    setState(() {
      loading = true;
    });
    List<Product> items = await fetchProducts(searchTerm: widget.searchTerm);
    setState(() {
      loading = false;
      products = items;
    });
  }

  List<Widget> buildProductList() => products
      .map(
        (product) => ProductItem(
          product: product,
        ),
      )
      .toList();
}
