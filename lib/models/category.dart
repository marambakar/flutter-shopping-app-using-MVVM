class Category {
  int _id;
  String _name;
  String _description;
  String _image;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get image => _image;

  Category({int id, String name, String description, String image}) {
    _id = id;
    _name = name;
    _description = description;
    _image = image;
  }

  Category.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["image"] = _image;
    return map;
  }
}
