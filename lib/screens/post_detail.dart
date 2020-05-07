import 'package:flutter/material.dart';
import 'package:project_map/model/http_service.dart';
import 'package:project_map/model/posts_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();
  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.title),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () async {
              await httpService.deletePost(post.username);
              Navigator.of(context).pop();
            },
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Username"),
                        subtitle: Text("${post.username}"),
                      ),
                      ListTile(
                        title: Text("Subject"),
                        subtitle: Text(post.subject),
                      ),
                      ListTile(
                        title: Text("Content"),
                        subtitle: Text("${post.content}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}