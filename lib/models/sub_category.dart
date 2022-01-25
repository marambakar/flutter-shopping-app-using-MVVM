import 'package:alayniah/models/category.dart';

class sub_Category {
  int _id;
  String _name;
  String _description;
  int _categoryId;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  int get categoryId =>_categoryId;
  sub_Category({int id, String name, String description,int categoryId}) {
    _id = id;
    _name = name;
    _description = description;
    _categoryId =categoryId;
  }

  sub_Category.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _categoryId=json["categoryId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["categoryId"]=_categoryId;
    return map;
  }
}
