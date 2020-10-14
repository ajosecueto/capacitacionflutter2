import 'package:capacitacionflutter2/core/network.dart';
import 'package:capacitacionflutter2/models/post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (post.type_post != 2) {
      return SizedBox();
    }

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.photo),
              ),
              Text(post.fullName)
            ],
          ),
          Text(post.message ?? ""),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  image: post.url != null && post.url != ""
                      ? DecorationImage(
                          image: NetworkImage(post.url), fit: BoxFit.fitWidth)
                      : null),
            ),
          )
        ],
      ),
    );
  }
}
