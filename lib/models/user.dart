
class UserProfile {
  int _id;
  String _firstName;
  String _lastName;
  double _phoneNumber;
  String _email;
  double _postCode;
  String _city;
  // Location _address;
//  bool _term;

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  double get phoneNumber => _phoneNumber;
  String get email => _email;
  double get postCode => _postCode;
  String get city => _city;
  // Location get address => _address;
//  bool get term => _term;

  UserProfile({
    int id,
    String firstName,
    String lastName,
    double phoneNumber,
    String email,
    double postCode,
    String city,
    // Location address,
//    bool term
  }){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _email = email;
    _postCode=postCode;
    _city=city;
    // _address=address;
//    _term = term;
  }

  UserProfile.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _phoneNumber = json["phone"];
    _email = json["email"];
    _postCode = json["postCode"];
    _city = json["city"];
    // _address = json["address"];
//    _term = json["term"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["phone"] = _phoneNumber;
    map["email"] = _email;
    map["postCode"] = _postCode;
    map["city"] = _city;
    // map["address"] = _address;
//    map["term"] = _term;
    return map;
  }

  set firstName(String value) {
    _firstName = value;
  }

  set lastName(String value) {
    _lastName = value;
  }

  set phoneNumber(double value) {
    _phoneNumber = value;
  }

  set email(String value) {
    _email = value;
  }

  set postCode(double value) {
    _postCode = value;
  }

  set city(String value) {
    _city = value;
  }

  set id(int value) {
    _id = value;
  }

}