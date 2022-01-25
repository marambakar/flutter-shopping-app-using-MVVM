class PushNotification {
  PushNotification({
    this.title,
    this.body,
    this.seen
  });

  String title;
  String body;
  bool seen;

  void setSeen(bool se){
    this.seen=se;
  }

  factory PushNotification.fromJson(Map<String, dynamic> json) {
    return PushNotification(
      title: json["title"],
      body: json["body"],
    );
  }
}