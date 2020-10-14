import 'dart:async';

import 'package:capacitacionflutter2/core/network.dart';
import 'package:capacitacionflutter2/models/post.dart';
import 'package:rxdart/rxdart.dart';

class SearchControllerRx {
  BehaviorSubject<String> _searchController = BehaviorSubject<String>();

  Stream<String> get getSearch => _searchController.stream;

  String get search => _searchController.value;

  set search(String q) => _searchController.sink.add(q);

  BehaviorSubject<String> _searchController2 = BehaviorSubject<String>();

  Stream<String> get getSearch2 => _searchController2.stream;

  SearchControllerRx() {
    _searchController.debounceTime(Duration(milliseconds: 300)).listen((event) {
      print("$event");
      _searchController2.add(event);
    });
  }

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
    _searchController.close();
    _searchController2.close();
  }
}
