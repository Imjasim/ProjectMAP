import 'package:flutter/material.dart';
import 'package:project_map/model/confession_class.dart';
import '../constants.dart';

class DetailScreen extends StatefulWidget {
  final Confession _data;

  DetailScreen(this._data);

  

  @override
  DetailScreenState createState(){
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  bool _isEnabled = true;
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
        body: SizedBox.expand (
          child: Container (
          color: Colors.pink[600],
          child: Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
        child: _isEnabled ?
        new ListTile(
          title: Text(widget._data.subject),
          subtitle: Text(widget._data.content),
          trailing: Text('by ${widget._data.username}'),
        ) :
        new TextField (
          controller: editText,
        )
       ),
       ),
      ),
    );
  }

  void choiceAction (String choice) {
    if (choice == DotMenu.edit) {
      setState(() {
        _isEnabled = false;
      });
    }
    else if (choice == DotMenu.delete) {
      
    }
  }
}