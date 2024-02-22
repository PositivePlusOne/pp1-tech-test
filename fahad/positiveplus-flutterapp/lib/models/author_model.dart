import 'dart:convert';

class Author {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  Author({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };
}
