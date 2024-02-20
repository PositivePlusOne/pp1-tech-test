import 'package:get_time_ago/get_time_ago.dart';
import 'package:positiveplus/app/app.locator.dart';
import 'package:positiveplus/models/post_model.dart';
import 'package:positiveplus/models/tag_model.dart';
import 'package:positiveplus/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<String> {
  final _apiService = locator<ApiService>();

  List<Post> posts = [];
  List<Tag> hashTags = [];

  List<String> tags = [];

  String convertDateIntoAgo(DateTime dateTimeOb) {
    var dateTime =
        dateTimeOb.subtract(const Duration(seconds: 1)); // [DateTime] object
    return (GetTimeAgo.parse(dateTime));
  }

  Future<String> getDataFromServer() async {
    posts = await _apiService.getPosts();
    hashTags = await _apiService.getTags();

    for (var tag in hashTags) {
      tags.add("#${tag.name!}");
    }

    return 'This is fetched from everywhere';
  }

  @override
  Future<String> futureToRun() => getDataFromServer();
}
