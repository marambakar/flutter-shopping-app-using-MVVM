
import 'package:alayniah/models/category.dart';
import 'package:alayniah/models/sub_category.dart';

class Product {
  int _id;
  String _name;
  String _description;
  String _image;
  double _price;
  bool _isfav;
  double _quantity;
  Category _category;
  int _subCategory;


  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get image => _image;
  double get price => _price;
  double get quantity => _quantity;
  bool get isfav => _isfav;
  Category get category =>_category;
  int get sub_Category =>_subCategory;

  Product({
    int id,
    String name,
    String description,
    String image,
    double price,
    bool isfav,
    double quantity,
    Category category,
    int subCategory
  }) {
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _price = price;
    _quantity = quantity;
    _isfav = isfav;
    _category= category;
    _subCategory=subCategory;
  }

  Product.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _image = json["image"];
    _price = json["price"];
    _quantity = json["quantity"];
    _isfav = json["isfav"];
    if (json["category"] != null) {
      _category= json["category"];
    }
    _subCategory = json["subCategory"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["image"] = _image;
    map["price"] = _price;
    map["quantity"] = _quantity;
    map["isfav"] = _isfav;
    map["category"] = _category;
    map["subCategory"] =_subCategory;

    return map;
  }
  bool get_isFav(){
    return this._isfav;
  }
  void set_isFav(bool fav){
    this._isfav =fav;
  }
}
