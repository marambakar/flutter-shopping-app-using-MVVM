

class Bill {
  int _billID;
  String _billDate;
//  Customer _customer;
  int _customerID;
//  List<Billproduct> _billProducts;
//  List<Payment> _payments;
//  Shipping _shipping;
  int _billStatus;
  bool _status;
  DateTime _datee;
  String _UserID;
  String _applicationUserID;
//  List<Refund> _refunds;
  double _totalMoney;

  int get billID => _billID;
  String get billDate => _billDate;
//  Customer get customer => _customer;
  int get customerID => _customerID;
//  List<Billproduct> get billProducts => _billProducts;
//  List<Payment> get payments => _payments;
//  Shipping get shipping => _shipping;
  int get billStatus => _billStatus;
  bool get status => _status;
  String get UserID => _UserID;
  DateTime get datee => _datee;
  String get applicationUserID => _applicationUserID;
//  List<Refund> get refunds => _refunds;
  double get totalMoney => _totalMoney;

  Bill(
      {int billID,
      String billDate,
//      Customer customer,
      int customerID,
//      List<Billproduct> billProducts,
//      List<Payment> payments,
//      Shipping shipping,
      int billStatus,
      bool status,
      DateTime datee,
      String applicationUserID,
      String UserID,
//      List<Refund> refunds,
      double totalMoney}) {
    _billID = billID;
    _billDate = billDate;
//    _customer = customer;
    _customerID = customerID;
//    _billProducts = billProducts;
//    _payments = payments;
//    _shipping = shipping;
    _billStatus = billStatus;
    _status = status;
    _datee = datee;
    _UserID = UserID;
    _totalMoney = totalMoney;
    _applicationUserID = applicationUserID;
//    _refunds = refunds;
  }

  Bill.fromJson(dynamic json) {
    _billID = json["billID"];
    _billDate = json["billDate"];
//    _customer =
//        json["customer"] != null ? Customer.fromJson(json["customer"]) : null;
    _customerID = json["customerID"];

//    if (json["billProducts"] != null) {
////      _billProducts = [];
//      json["billProducts"].forEach((v) {
//        _billProducts.add(Billproduct.fromJson(v));
//      });
//    }
//    if (json["payments"] != null) {
//      _payments = [];
//      json["payments"].forEach((v) {
//        _payments.add(Payment.fromJson(v));
//      });
//    }
//    if (json["refunds"] != null) {
//      _refunds = [];
//      json["refunds"].forEach((v) {
//        _refunds.add(Refund.fromJson(v));
//      });
//    }
//    _shipping =
//        json["shipping"] != null ? Shipping.fromJson(json["shipping"]) : null;
    _totalMoney = json["totalMoney"];
    _customerID = json["customerID"];
    _billStatus = json["billStatus"];
    _status = json["status"];
    _applicationUserID = json["applicationUserID"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["billID"] = _billID;
    map["billDate"] = _billDate;
//    if (_customer != null) {
//      map["customer"] = _customer.toJson();
//    }
    map["customerID"] = _customerID;
//    if (_billProducts != null) {
//      map["billProducts"] = _billProducts.map((v) => v.toJson()).toList();
//    }
//    map["billProducts"] = _billProducts;
//    if (_payments != null) {
//      map["payments"] = _payments.map((v) => v.toJson()).toList();
//    }
//    map["refunds"] = _refunds;
//    if (_shipping != null) {
//      map["shipping"] = _shipping.toJson();
//    }
//    if (_refunds != null) {
//      map["refunds"] = _refunds.map((v) => v.toJson()).toList();
//    }
    map["totalMoney"] = _totalMoney;
    map["billStatus"] = _billStatus;
    map["status"] = _status;
    map["applicationUserID"] = _applicationUserID;
    return map;
  }

  Bill.fromMap(dynamic json) {
    int ss;
    int id;
     id=json["UserID"];
     _UserID=id.toString();
    _billID = json["billID"];
    _billDate = json["billDate"];
    _customerID = json["customerID"];
    // _datee = json["datebill"];

    _billStatus = json["billStatus"];
    ss = json["status"];
    //  _status =ss;
    print("ss" + ss.toString());
    if (ss == 1) {
      _status = true;
    } else {
      _status = false;
    }
  }

  Map<String, dynamic> toMap() {
    bool ss;
    var map = <String, dynamic>{};
    map["billID"] = _billID;
     map["UserID"] = _UserID;
    map["billDate"] = _billDate;

    map["customerID"] = _customerID;

    map["billStatus"] = _billStatus;
    // map["datebill"]=_datee;
    ss = _status;

    if (ss) {
      map["status"] = 1;
      print("sstoMap" + map["status"].toString());
    } else {
      map["status"] = 0;
    }
    return map;
  }

  set datee(DateTime value) {
    _datee = value;
  }

  set billID(int value) {
    _billID = value;
  }

  set status(bool value) {
    _status = value;
  }

  set billStatus(int value) {
    _billStatus = value;
  }

//  set shipping(Shipping value) {
//    _shipping = value;
//  }

//  set refunds(dynamic value) {
//    _refunds = value;
//  }

//  set payments(List<Payment> value) {
//    _payments = value;
//  }

//  set billProducts(List<Billproduct> value) {
//    _billProducts = value;
//  }

  set customerID(int value) {
    _customerID = value;
  }

//  set customer(Customer value) {
//    _customer = value;
//  }

  set billDate(String value) {
    _billDate = value;
  }

  set UserID(String value) {
    _UserID = value;
  }

  set totalMoney(double value) {
    _totalMoney = value;
  }

  set applicationUserID(String value) {
    _applicationUserID = value;
  }

}
