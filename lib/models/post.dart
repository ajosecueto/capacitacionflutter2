import 'package:capacitacionflutter2/models/owner.dart';

class Post {
  int by_shared;
  bool commented;
  int count_comment;
  int count_like;
  int count_shared;
  String date;
  int id;
  bool is_influencer;
  String last_name;
  bool liked;
  String message;
  String name;
  Owner owner;
  String owner_shared;
  String owner_shared_id;
  int person_type;
  String photo;
  String photo_owner_shared;
  bool shared;
  int status;
  int type_post;
  String url;
  int user_id;
  String username;
  String verb;

  Post(
      {this.by_shared,
      this.commented,
      this.count_comment,
      this.count_like,
      this.count_shared,
      this.date,
      this.id,
      this.is_influencer,
      this.last_name,
      this.liked,
      this.message,
      this.name,
      this.owner,
      this.owner_shared,
      this.owner_shared_id,
      this.person_type,
      this.photo,
      this.photo_owner_shared,
      this.shared,
      this.status,
      this.type_post,
      this.url,
      this.user_id,
      this.username,
      this.verb});

  String get fullName => this.name + ' ' + this.last_name;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      by_shared: json['by_shared'],
      commented: json['commented'],
      count_comment: json['count_comment'],
      count_like: json['count_like'],
      count_shared: json['count_shared'],
      date: json['date'],
      id: json['id'],
      is_influencer: json['is_influencer'],
      last_name: json['last_name'],
      liked: json['liked'],
      message: json['message'],
      name: json['name'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      owner_shared: json['owner_shared'],
      owner_shared_id: json['owner_shared_id'],
      person_type: json['person_type'],
      photo: json['photo'],
      photo_owner_shared: json['photo_owner_shared'],
      shared: json['shared'],
      status: json['status'],
      type_post: json['type_post'],
      url: json['url'],
      user_id: json['user_id'],
      username: json['username'],
      verb: json['verb'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by_shared'] = this.by_shared;
    data['commented'] = this.commented;
    data['count_comment'] = this.count_comment;
    data['count_like'] = this.count_like;
    data['count_shared'] = this.count_shared;
    data['date'] = this.date;
    data['id'] = this.id;
    data['is_influencer'] = this.is_influencer;
    data['last_name'] = this.last_name;
    data['liked'] = this.liked;
    data['message'] = this.message;
    data['name'] = this.name;
    data['owner_shared'] = this.owner_shared;
    data['owner_shared_id'] = this.owner_shared_id;
    data['person_type'] = this.person_type;
    data['photo'] = this.photo;
    data['photo_owner_shared'] = this.photo_owner_shared;
    data['shared'] = this.shared;
    data['status'] = this.status;
    data['type_post'] = this.type_post;
    data['url'] = this.url;
    data['user_id'] = this.user_id;
    data['username'] = this.username;
    data['verb'] = this.verb;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}
