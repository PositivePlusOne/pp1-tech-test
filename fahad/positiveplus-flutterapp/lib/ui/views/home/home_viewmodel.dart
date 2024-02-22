import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:positiveplus/app/app.bottomsheets.dart';
import 'package:positiveplus/app/app.dialogs.dart';
import 'package:positiveplus/app/app.locator.dart';
import 'package:positiveplus/models/post_model.dart';
import 'package:positiveplus/models/tag_model.dart';
import 'package:positiveplus/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel<String> {
  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<Post> posts = [];
  List<Tag> hashTags = [];

  IconData icon = Icons.favorite_border;
  Color color = const Color(0xff6B6B67);

  List<String> tags = [];

  String dropdownValue = '1';

  int likes = 22;

  bool isLiked = false;

  var items = ["Edit", "Delete", "Share", "Hide"];

  String convertDateIntoAgo(DateTime dateTimeOb) {
    var dateTime =
        dateTimeOb.subtract(const Duration(seconds: 1)); // [DateTime] object
    return (GetTimeAgo.parse(dateTime));
  }

  void showDialog({required String title}) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: title,
      description: '45k people are using $title',
    );
  }

  void showBottomSheet({required String title}) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: title,
      description: "We will soon be adding share feature!",
    );
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

  void likePost({required bool isLike}) {
    if (isLike) {
      icon = Icons.favorite;
      color = Colors.pink;
      isLiked = isLike;
      likes++;
    } else {
      icon = Icons.favorite_border;
      color = const Color(0xff6B6B67);
      isLiked = isLike;
      likes--;
    }
    rebuildUi();
  }

}
