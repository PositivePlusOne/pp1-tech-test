import 'dart:convert';

class Post {
  int? id;
  String? title;
  String? body;
  String? featuredImage;
  DateTime? createdOn;
  DateTime? lastModified;
  List<dynamic>? categories;
  List<dynamic>? comments;
  List<dynamic>? likes;
  List<dynamic>? hashtags;
  int? totalLikes;
  int? totalComments;

  Post({
    this.id,
    this.title,
    this.body,
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
        featuredImage: json["featured_image"],
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
        lastModified: json["last_modified"] == null
            ? null
            : DateTime.parse(json["last_modified"]),
        categories: json["categories"] == null
            ? []
            : List<dynamic>.from(json["categories"]!.map((x) => x)),
        comments: json["comments"] == null
            ? []
            : List<dynamic>.from(json["comments"]!.map((x) => x)),
        likes: json["likes"] == null
            ? []
            : List<dynamic>.from(json["likes"]!.map((x) => x)),
        hashtags: json["hashtags"] == null
            ? []
            : List<dynamic>.from(json["hashtags"]!.map((x) => x)),
        totalLikes: json["total_likes"],
        totalComments: json["total_comments"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "featured_image": featuredImage,
        "created_on": createdOn?.toIso8601String(),
        "last_modified": lastModified?.toIso8601String(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "comments":
            comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
        "hashtags":
            hashtags == null ? [] : List<dynamic>.from(hashtags!.map((x) => x)),
        "total_likes": totalLikes,
        "total_comments": totalComments,
      };
}
