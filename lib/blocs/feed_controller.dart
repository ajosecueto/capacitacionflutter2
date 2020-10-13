import 'package:capacitacionflutter2/core/network.dart';
import 'package:capacitacionflutter2/models/post.dart';

class FeedController {

  Future<List<Post>> getAllData() async {
    try {
      final jsonDecoded = await Network.get("api/feed/");
      return (jsonDecoded["data"] as List)
          .map((e) => Post.fromJson(e))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

}
