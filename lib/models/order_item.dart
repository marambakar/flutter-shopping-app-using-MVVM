

import 'package:alayniah/models/order.dart';
import 'package:alayniah/models/product.dart';

class OrderItem {
  int _id;
  int _amount;
  Product _product;
  Order _order;
  double _subTotal;

  set id(int value) {
    _id = value;
  }

  int get id => _id;
  int get amount => _amount;
  Product get product => _product;
  Order get order => _order;
  double get subTotal => _subTotal;

  OrderItem({int id, int amount, Product product, Order order,double subTotal}) {
    _id = id;
    _amount = amount;
    _product = product;
    _order = order;
    _subTotal=subTotal;
  }

  OrderItem.fromJson(dynamic json) {
    _id = json["id"];
    _amount = json["amount"];
    if (json["product"] != null) {
      _product = json["product"];
    }
    if (json["orders"] != null) {
      _order = json["order"];
    }
    _subTotal = json["subTotal"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["amount"] = _amount;
    map["product"] = _product;
    map["order"] = _order;
    map["subTotal"] = _subTotal;
    // if (_products != null) {
    //   map["products"] = _products.map((v) => v.toJson()).toList();
    // }
    return map;
  }

  set amount(int value) {
    _amount = value;
  }

  set product(Product value) {
    _product = value;
  }

  set order(Order value) {
    _order = value;
  }

  set subTotal(double value) {
    _subTotal = value;
  }
}
