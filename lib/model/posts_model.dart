import 'package:flutter/foundation.dart';

class Post {
  final String username;
  final String subject;
  final String content;

  Post({
    @required this.username,
    @required this.subject,
    @required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['username'] as String,
      subject: json['subject'] as String,
      content: json['content'] as String,
    );
  }

  String get title => null;
}