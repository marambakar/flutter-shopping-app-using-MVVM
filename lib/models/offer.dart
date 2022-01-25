
import 'package:alayniah/models/product.dart';

class Offer {
  int _id;
  String _name;
  String _description;
  String _image;
  double _price;
  Product _product;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get image => _image;
  double get price => _price;
  Product get product => _product;


  Offer({int id, String name, String description,String image,double price,Product product}) {
    _id = id;
    _name = name;
    _description = description;
    _image=image;
    _price=price;
    _product=product;
  }

  Offer.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _image = json["image"];
    _price = json["price"];
    _product =
    json["product"] != null ? Product.fromJson(json["product"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["image"] = _image;
    map["price"] = _price;
    if (_product != null) {
      map["product"] = _product.toJson();
    }
    return map;
  }
}
