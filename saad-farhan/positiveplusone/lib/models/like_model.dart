class Like{
  int id;
  int userId;

  Like({
    required this.id,
    required this.userId
  });

  factory Like.fromJson(Map<String, dynamic> map){
    return Like(id: map["id"], userId: map["user_id"]);
  }
}