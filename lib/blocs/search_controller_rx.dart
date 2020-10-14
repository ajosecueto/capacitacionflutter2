import 'dart:async';

import 'package:capacitacionflutter2/core/network.dart';
import 'package:capacitacionflutter2/models/post.dart';

class SearchControllerRx {
  StreamController<List<Post>> _streamController =
      StreamController<List<Post>>();

  Stream<List<Post>> get getData => _streamController.stream;

  getAllPosts({int id = 1}) async {
    try {
      final jsonDecoded =
          await Network.get("api/v2/hashtags-posts/?hashtags=$id");
      _streamController.sink.add((jsonDecoded["results"] as List)
          .map((e) => Post.fromJson(e))
          .toList());
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
