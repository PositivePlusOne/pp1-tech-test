import 'dart:convert';

class Comment {
  int? id;
  int? user;
  String? body;
  DateTime? createdOn;
  int? post;

  Comment({
    this.id,
    this.user,
    this.body,
    this.createdOn,
    this.post,
  });

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        user: json["user"],
        body: json["body"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        post: json["post"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "body": body,
        "created_on": createdOn?.toIso8601String(),
        "post": post,
      };
}
