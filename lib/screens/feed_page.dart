import 'package:capacitacionflutter2/blocs/feed_controller.dart';
import 'package:capacitacionflutter2/models/post.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  FeedController _feedController = FeedController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Post>>(
          future: _feedController.getAllData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text("waiting...");
              case ConnectionState.none:
                return Text("No hay conexion con el server...");
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                // TODO: Handle this case.
                break;
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text("Se ha producido un error");
            }

            if (snapshot.hasData) {
              print(snapshot.data);
              return Text("Hay feedd");
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
