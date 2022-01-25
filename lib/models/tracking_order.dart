class Tracking {
  int _id;
  String _invoice;
  DateTime _received;
  DateTime _ontheway;
  DateTime _delivered;
  bool _isdelivered;


  int get id => _id;
  String get invoice => _invoice;
  DateTime get received => _received;
  DateTime get ontheway => _ontheway;
  DateTime get delivered => _delivered;
  bool get isdelivered => _isdelivered;

  Tracking({
    int id,
    String invoice,
    DateTime received,
    DateTime ontheway,
    DateTime delivered,
    bool isdelivered,
  }) {
    _id = id;
    _invoice = invoice;
    _received = received;
    _ontheway = ontheway;
    _delivered = delivered;
    _isdelivered = isdelivered;
  }

  Tracking.fromJson(dynamic json) {
    _id = json["id"];
    _invoice = json["invoice"];
    _received = json["received"];
    _ontheway = json["ontheway"];
    _delivered = json["delivered"];
    _isdelivered = json["isdelivered"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["invoice"] = _invoice;
    map["received"] = _received;
    map["ontheway"] = _ontheway;
    map["delivered"] = _delivered;
    map["isdelivered"] = _isdelivered;

    return map;
  }
}
