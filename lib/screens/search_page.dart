import 'package:capacitacionflutter2/blocs/search_controller.dart';
import 'package:capacitacionflutter2/blocs/search_controller_rx.dart';
import 'package:capacitacionflutter2/models/Hashtag.dart';
import 'package:capacitacionflutter2/models/post.dart';
import 'package:capacitacionflutter2/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchController _searchController = SearchController();
  SearchControllerRx _searchControllerRx = SearchControllerRx();
  int _hashtagId = 1;

  @override
  void dispose() {
    // TODO: implement dispose
    _searchControllerRx.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              FutureBuilder<List<Hashtag>>(
                future: _searchController.getAllData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: snapshot.data
                            .map((e) => InkWell(
                                  onTap: () {
                                    _searchControllerRx.getAllPosts(id: e.id);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Chip(
                                      label: Text(e.description),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
              StreamBuilder<List<Post>>(
                  stream: _searchControllerRx.getData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Container(
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return PostWidget(post: snapshot.data[index]);
                              }),
                        ),
                      );
                    }

                    return SizedBox();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
