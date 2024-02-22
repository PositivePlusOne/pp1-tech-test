import 'dart:convert';

import 'package:positiveplus/models/author_model.dart';

class Like {
  int? id;
  Author? user;
  int? post;
  DateTime? createdOn;

  Like({
    this.id,
    this.user,
    this.post,
    this.createdOn,
  });

  factory Like.fromRawJson(String str) => Like.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"],
        user: json["user"] == null ? null : Author.fromJson(json["user"]),
        post: json["post"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "post": post,
        "created_on": createdOn?.toIso8601String(),
      };
}
