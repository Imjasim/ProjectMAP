import 'package:flutter/material.dart';
import 'package:project_map/forms/confessionnForm.dart';
import 'package:project_map/model/posts_model.dart';
import 'package:project_map/screens/post_detail.dart';


class PostsPage extends StatelessWidget {
  final ConfessionForm httpService = HttpService();
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Posts"),
          ),
          body: FutureBuilder(
            future: httpService.getPosts(),
            builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data;
                return ListView(
                  children: posts.map((Post post) => ListTile(
                          title: Text(post.title),
                          subtitle: Text("${post.username}"),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PostDetail(
                                post: post,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      }
    
      static HttpService() {}
  }
  
  class HttpService {
}