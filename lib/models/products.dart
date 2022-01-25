

import 'package:alayniah/models/product.dart';

class Products {
  List<Product> _products;

  Products({
    List<Product>products
  })
  {
    this._products = products;
    if(products == null)
    {
      this._products = new List<Product>();
    }
  }
  List<Product> get products => _products;
  set products(List<Product> products) => _products = products;

  factory Products.fromJson(List<dynamic> json) => Products(
      products: List<Product>.from(json.map((x) => Product.fromJson(x))));
}