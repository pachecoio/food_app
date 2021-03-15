import 'package:food_app/models/product.dart';

List<Product> STATIC_PRODUCT_LIST = [
  Product(
    id: 1,
    name: "Burguer Premium",
    description: "Bread, burguer, tomato, lettuce, cheese and special sauce",
    price: 16,
    image:
        "https://res.cloudinary.com/simplecoder/image/upload/v1615749110/food_app/unnamed.png",
  ),
  Product(
    id: 2,
    name: "Hotdog Premium",
    description: "Bread, sausage, tomato, lettuce, cheese and special sauce",
    price: 12,
    image:
        "https://res.cloudinary.com/simplecoder/image/upload/v1615749386/food_app/2cd43b_a62f08f341744535b7de05a1a0b280c8_mv2.png",
  ),
  Product(
    id: 3,
    name: "Special Noodle",
    description: "Pasta, legumes, onions, pepper",
    price: 20,
    image:
        "https://res.cloudinary.com/simplecoder/image/upload/v1615678151/portfolio/noodle.png",
  ),
  Product(
    id: 4,
    name: "Burguer Premium",
    description: "Bread, burguer, tomato, lettuce, cheese and special sauce",
    price: 16,
    image:
        "https://res.cloudinary.com/simplecoder/image/upload/v1615749110/food_app/unnamed.png",
  ),
  Product(
    id: 5,
    name: "Hotdog Premium",
    description: "Bread, sausage, tomato, lettuce, cheese and special sauce",
    price: 12,
    image:
        "https://res.cloudinary.com/simplecoder/image/upload/v1615749386/food_app/2cd43b_a62f08f341744535b7de05a1a0b280c8_mv2.png",
  ),
  Product(
    id: 6,
    name: "Special Noodle",
    description: "Pasta, legumes, onions, pepper",
    price: 20,
    image:
        "https://res.cloudinary.com/simplecoder/image/upload/v1615678151/portfolio/noodle.png",
  ),
];

Future<List<Product>> fetchProducts({String searchTerm}) async {
  if (searchTerm != null)
    return STATIC_PRODUCT_LIST
        .where((product) =>
            (product.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
                product.description
                    .toLowerCase()
                    .contains(searchTerm.toLowerCase())))
        .toList();
  return STATIC_PRODUCT_LIST;
}
