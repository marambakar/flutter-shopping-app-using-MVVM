

import 'package:alayniah/models/user.dart';

class Order {
  int _id;
  int _no;
  int _totalAmount;
  DateTime _orderDate;
  UserProfile _userProfile;
  bool _isDelivered;
  String _status;

  set id(int value) {
    _id = value;
  }

  int get id => _id;
  int get no => _no;
  int get totalAmount => _totalAmount;
  DateTime get orderDate => _orderDate;
  UserProfile get userProfile => _userProfile;
  bool get isDelivered => _isDelivered;
  String get status => _status;
  Order(
      {int id,
      int no,
      int totalAmount,
      DateTime orderDate,
      UserProfile userProfile,
      bool isDelivered,
      String status}) {
    _id = id;
    _no = no;
    _totalAmount = totalAmount;
    _orderDate = orderDate;
    _userProfile = userProfile;
    _isDelivered = isDelivered;
    _status=status;
  }

  Order.fromJson(dynamic json) {
    _id = json["id"];
    _no = json["no"];
    _totalAmount = json["totalAmount"];
    _orderDate = json["orderDate"];
    if (json["userProfile"] != null) {
      _userProfile = json["userProfile"];
    }
    _isDelivered = json["isDelivered"];
    _status=json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["no"] = _no;
    map["totalAmount"] = _totalAmount;
    map["orderDate"] = _orderDate;
    map["userProfile"] = _userProfile;
    map["isDelivered"]=_isDelivered;
    map["status"]=_status;
    // if (_products != null) {
    //   map["products"] = _products.map((v) => v.toJson()).toList();
    // }
    return map;
  }

  set no(int value) {
    _no = value;
  }

  set totalAmount(int value) {
    _totalAmount = value;
  }

  set orderDate(DateTime value) {
    _orderDate = value;
  }

  set userProfile(UserProfile value) {
    _userProfile = value;
  }

  set isDelivered(bool value) {
    _isDelivered = value;
  }

  set status(String value) {
    _status = value;
  }
}
