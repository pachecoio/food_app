import 'package:flutter/material.dart';
import 'package:food_app/food_app_icons.dart';
import 'package:food_app/helpers/utils.dart';
import 'package:food_app/models/product.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/button_primary.dart';
import 'package:food_app/widgets/quantity_button.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String imageTag;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: true);
    final Product product = ModalRoute.of(context).settings.arguments;

    if (imageTag == null) imageTag = "product_image_${product.id}";

    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print('show cart');
            },
            child: Icon(
              FoodApp.bag,
              color: colorGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Food description
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: Text(
                        product.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: colorGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                  ],
                ),
              ),
              // Food image
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: imageTag,
                child: Container(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(product.image),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Quantity
              Container(
                child: Center(
                  child: QuantityButton(
                    onChange: (value) {
                      print('set value $value');
                      setState(() {
                        quantity = value;
                      });
                    },
                    initialValue: quantity,
                  ),
                ),
              ),
              // Price and cart
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                            color: colorGrey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$ ${formatCurrency(product.price)}",
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ButtonPrimary(
                      text: "ADD TO CART",
                      onTap: () {
                        addProduct(context, cartProvider, product);
                      },
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

  addProduct(
    BuildContext context,
    CartProvider provider,
    Product product,
  ) {
    print('Add $quantity products');
    setState(() {
      imageTag = "product_image_cart_${product.id}";
    });
    for (int i = 0; i < quantity; i++) {
      provider.addProduct(product);
    }
    Navigator.pop(context);
  }
}
