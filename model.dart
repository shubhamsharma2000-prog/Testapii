import 'dart:convert';

List<Testapi> testapiFromJson(String str) =>
    List<Testapi>.from(json.decode(str).map((x) => Testapi.fromJson(x)));

String testapiToJson(List<Testapi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Testapi {
  int userId;
  int id;
  String title;
  String body;

  Testapi({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Testapi.fromJson(Map<String, dynamic> json) => Testapi(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
