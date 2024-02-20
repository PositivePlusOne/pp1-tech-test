import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:positiveplus/models/post_model.dart';
import 'package:positiveplus/models/tag_model.dart';

class ApiService {
  Future<List<Post>> getPosts() async {
    final String postsUrl = dotenv.env["GET_POSTS"]!;
    final response = await http.get(Uri.parse(postsUrl));

    if (response.statusCode < 400) {
      final Iterable items = jsonDecode(response.body);
      var list = items.map((e) => Post.fromJson(e)).toList();
      list.removeAt(0);
      return list;
    }

    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }

  Future<List<Tag>> getTags() async {
    final String tagsUrl = dotenv.env["GET_TAGS"]!;
    final response = await http.get(Uri.parse(tagsUrl));

    if (response.statusCode < 400) {
      final Iterable items = jsonDecode(response.body);
      return items.map((e) => Tag.fromJson(e)).toList();
    }

    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }
}
