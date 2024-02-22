class Comment{
  int id;
  String content;

  Comment({
    required this.id,
    required this.content
  });

  factory Comment.fromJson(Map<String, dynamic> map){
    return Comment(id: map["id"], content: map["content"]);
  }
}