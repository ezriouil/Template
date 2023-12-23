class LocalNotification {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  final int? id;
  final String? title, body, time;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR - - - - - - - - - - - - - - - - - -  //
  LocalNotification(
      {this.id = 0,
      required this.title,
      required this.body,
      required this.time});

  // - - - - - - - - - - - - - - - - - - FROM JSON - - - - - - - - - - - - - - - - - -  //
  static LocalNotification fromJson(Map<String, dynamic> json) {
    return LocalNotification(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        time: json["time"]);
  }

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "time": time,
      };
}
