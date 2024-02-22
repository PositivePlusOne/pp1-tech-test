import 'dart:convert';

import 'package:positiveplus/models/author_model.dart';
import 'package:positiveplus/models/category_model.dart';
import 'package:positiveplus/models/comment_model.dart';
import 'package:positiveplus/models/like_model.dart';
import 'package:positiveplus/models/tag_model.dart';

class Post {
  int? id;
  String? title;
  String? body;
  Author? author;
  String? featuredImage;
  DateTime? createdOn;
  DateTime? lastModified;
  List<Category>? categories;
  List<Comment>? comments;
  List<Like>? likes;
  List<Tag>? hashtags;
  int? totalLikes;
  int? totalComments;

  Post({
    this.id,
    this.title,
    this.body,
    this.author,
    this.featuredImage,
    this.createdOn,
    this.lastModified,
    this.categories,
    this.comments,
    this.likes,
    this.hashtags,
    this.totalLikes,
    this.totalComments,
  });

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        featuredImage: json["featured_image"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        lastModified: json["last_modified"] == null
            ? null
            : DateTime.parse(json["last_modified"]),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromJson(x))),
        likes: json["likes"] == null
            ? []
            : List<Like>.from(json["likes"]!.map((x) => Like.fromJson(x))),
        hashtags: json["hashtags"] == null
            ? []
            : List<Tag>.from(json["hashtags"]!.map((x) => Tag.fromJson(x))),
        totalLikes: json["total_likes"],
        totalComments: json["total_comments"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "author": author?.toJson(),
        "featured_image": featuredImage,
        "created_on": createdOn?.toIso8601String(),
        "last_modified": lastModified?.toIso8601String(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "likes": likes == null
            ? []
            : List<dynamic>.from(likes!.map((x) => x.toJson())),
        "hashtags": hashtags == null
            ? []
            : List<dynamic>.from(hashtags!.map((x) => x.toJson())),
        "total_likes": totalLikes,
        "total_comments": totalComments,
      };
}
