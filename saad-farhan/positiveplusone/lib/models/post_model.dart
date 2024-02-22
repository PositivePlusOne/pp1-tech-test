import 'package:positiveplusone/models/comment_model.dart';
import 'package:positiveplusone/models/tag_model.dart';

class Post{
  int id;
  String caption;
  String? imageUri;
  int likeCount;
  int userId;
  String userImage;
  String userName;
  List<Tag> tags;
  List<Comment> comments;
  String createdAd;

  Post({
    required this.id,
    required this.caption,
    this.imageUri,
    required this.likeCount,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.tags,
    required this.comments,
    required this.createdAd
  });

 factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      caption: json['caption'] as String,
      imageUri: json['image_uri'] as String?,
      likeCount: json['like_count'] as int,
      userId: json['user_id'] as int,
      userName: json["user"]["user_name"] as String,
      userImage: json["user"]['photo_url'] as String,
      createdAd: json["time_created"] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((tagJson) => Tag.fromJson(tagJson))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((commentJson) => Comment.fromJson(commentJson))
          .toList(),
    );
  }
  
}