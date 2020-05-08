import 'package:flutter/material.dart';
import 'package:project_map/model/confession_class.dart';
import '../constants.dart';

class ConfessionDetailScreen extends StatefulWidget {
  final Confession _data;

  ConfessionDetailScreen(this._data);

  

  @override
  ConfessionDetailScreenState createState(){
    return ConfessionDetailScreenState();
  }
}

class ConfessionDetailScreenState extends State<ConfessionDetailScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context,widget._data);}
        ),
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: Colors.pink[900],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (context) {
            return DotMenu.confessionsMenu.map((String menu) {
            return PopupMenuItem<String> (
            value: menu,
            child: Text(menu),
          );
            }).toList();
            },
          ),
        ],
        ),
      body: nonEditable() 
    );
  }

  void choiceAction (String choice) {
    if (choice == DotMenu.delete) {
      Navigator.pop(context,1);
    }
  }

  Widget nonEditable () {
    return SingleChildScrollView(
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
                                    title: Text("Name"),
                                    subtitle: Text("${widget._data.username}"),
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
                                    subtitle: Text("${widget._data.subject}"),
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
                                    title: Text("Content"),
                                    subtitle: Text("${widget._data.content}"),
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
        );
  }
}
