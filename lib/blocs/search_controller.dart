import 'package:capacitacionflutter2/core/network.dart';
import 'package:capacitacionflutter2/models/Hashtag.dart';
import 'package:capacitacionflutter2/models/post.dart';

class SearchController {
  Future<List<Hashtag>> getAllData() async {
    try {
      final jsonDecoded = await Network.get("api/v2/hashtags/");
      return (jsonDecoded["results"] as List)
          .map((e) => Hashtag.fromJson(e))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Post>> getAllPosts({int id = 1}) async {
    try {
      final jsonDecoded =
          await Network.get("api/v2/hashtags-posts/?hashtags=$id");
      return (jsonDecoded["results"] as List)
          .map((e) => Post.fromJson(e))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }
}
