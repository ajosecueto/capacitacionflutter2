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
  ValueNotifier<bool> _notifier = ValueNotifier<bool>(false);
  TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchControllerRx.dispose();
    _editingController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(100),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: _editingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: ValueListenableBuilder<bool>(
                          valueListenable: _notifier,
                          builder: (_, value, child) {
                            return value
                                ? IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      _editingController.text = "";
                                      _notifier.value = false;
                                      _searchControllerRx.search = "";
                                    },
                                  )
                                : SizedBox();
                          },
                        )),
                    onChanged: (value) {
                      _searchControllerRx.search = value;
                      _notifier.value = value.isNotEmpty;
                    },
                  ),
                ),
              ),
              StreamBuilder<String>(
                initialData: "",
                stream: _searchControllerRx.getSearch2,
                builder: (context, snapshot) {
                  return Text(snapshot.data);
                },
              ),
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
