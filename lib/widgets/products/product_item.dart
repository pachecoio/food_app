import 'package:flutter/material.dart';
import 'package:food_app/food_app_icons.dart';
import 'package:food_app/helpers/utils.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/utils/colors.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  ProductItem({Key key, this.product}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.all(
        20,
      ),
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
          color: colorBackgroundLight,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            navigateToProduct(context);
          },
          child: Row(
            children: [
              // Product image
              Hero(
                tag: "product_image_${widget.product.id}",
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        widget.product.image,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // Product details
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color: colorGreyLight,
                            size: 20,
                          ),
                          Text(
                            "590g",
                            style: TextStyle(
                              color: colorGreyLight,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            FoodApp.fire,
                            color: Colors.orange,
                            size: 15,
                          ),
                          Text(
                            "99 calories",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$ ${formatCurrency(widget.product.price)}",
                      style: TextStyle(
                        color: colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateToProduct(context) {
    Navigator.pushNamed(
      context,
      "/product/details",
      arguments: widget.product,
    );
  }
}
