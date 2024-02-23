class Tag{
  int id;
  String content;

  Tag({
    required this.id,
    required this.content
  });

  factory Tag.fromJson(Map<String, dynamic> map){
    return Tag(id: map["id"], content: map["content"]);
  }
}