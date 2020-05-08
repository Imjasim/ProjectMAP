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
  bool _isEditable = false;
  final editText =TextEditingController() ;

  void initState() {
    editText.text=widget._data.content;
    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: Colors.pink[900],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (context) {
            return DotMenu.eventsMenu.map((String eventMenu) {
            return PopupMenuItem<String> (
            value: eventMenu,
            child: Text(eventMenu),
          );
            }).toList();
            },
          ),
        ],
        ),
      body: _isEditable ?
      editable() :
      nonEditable() 
    );
  }

  void choiceAction (String choice) {
    if (choice == DotMenu.edit) {
      setState(() {
        _isEditable = true;
      });
    }
    else if (choice == DotMenu.delete) {
      Navigator.pop(context,1);
    }
  }

  Widget editable() {
    return TextField (
          controller: editText
    );
    //Implement two buttons to save and cancel the changes made to the content of the confession
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