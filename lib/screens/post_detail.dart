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
                     Row( 
                        children: <Widget>[
                          new Text("Details",style: new TextStyle(fontSize:30.0,),textAlign: TextAlign.left,),
                        ],
                        ),  
                         Row( 
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0xEE03A2)
                              ),
                              child: new Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Username"),
                                    subtitle: Text("${post.username}"),
                                  ),
                                ],),
                               )
                               ),
                           new Expanded(
                             child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0xEE03A2)
                              ),
                              child: new Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Subject"),
                                    subtitle: Text("${post.subject}"),
                                  ),
                                ],),
                               )
                               ),
                        ],
                        ), 
                          Row( 
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0x03EEEE)
                              ),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Username"),
                                    subtitle: Text("${post.content}"),
                                  ),
                                ],),
                               )
                               ),
                    ],
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


// ListTile(
 //                       title: Text("Username"),
 //                       subtitle: Text("${post.username}"),
 //                     ),
  //                    ListTile(
  //                      title: Text("Subject"),
  //                      subtitle: Text(post.subject),
   //                   ),
   //                   ListTile(
   //                     title: Text("Content"),
    //                    subtitle: Text("${post.content}"),
