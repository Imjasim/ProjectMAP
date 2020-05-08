import 'package:flutter/material.dart';
import 'package:project_map/model/event_class.dart';
import '../constants.dart';

class EventDetailScreen extends StatefulWidget {
  final Event _data;

  EventDetailScreen(this._data);

  

  @override
  EventDetailScreenState createState(){
    return EventDetailScreenState();
  }
}

class EventDetailScreenState extends State<EventDetailScreen> {
  bool _isEditable = false;
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
            return DotMenu.eventsMenu.map((String menu) {
            return PopupMenuItem<String> (
            value: menu,
            child: Text(menu),
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

  Widget _buildtitle(){
    final editText1 =TextEditingController() ;
    final editText2 =TextEditingController() ;
    final editText3 =TextEditingController() ;
    final editText4 =TextEditingController() ;
    editText1.text=widget._data.eventName;
    editText2.text=widget._data.time;
    editText3.text=widget._data.venue;
    editText4.text=widget._data.description;

      return Column(
        children: <Widget>[ 
          TextFormField(
        controller: editText1,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Event Name'),
        validator: (String value){
        if(value.isEmpty){
        return 'Event INFO is required';
        }
        },
        onSaved: (String value)
        {
          widget._data.eventName = value;
        },
        ),
        TextFormField(
        controller: editText2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Venue'),
        validator: (String value){
        if(value.isEmpty){
        return 'Event INFO is required';
        }
        },
        onSaved: (String value)
        {
          widget._data.venue = value;
        },
        ),
        TextFormField(
        controller: editText3,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Time'),
        validator: (String value){
        if(value.isEmpty){
        return 'Event INFO is required';
        }
        },
        onSaved: (String value)
        {
          widget._data.time = value;
        },
        ),
        TextFormField(
        controller: editText4,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Description'),
        validator: (String value){
        if(value.isEmpty){
        return 'Event INFO is required';
        }
        },
        onSaved: (String value)
        {
          widget._data.description = value;
        },
        ),
        ],
        );
  }

  Widget editable() {
    return Scaffold(
        //appBar: AppBar(title : Text("EditForm")),
      body:Container(
        margin : EdgeInsets.all(24),
        child : Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
           // _buildpicture(),
           _buildtitle(),
           // _builddescription(),
            SizedBox(height:100),
               RaisedButton.icon(
                 onPressed: () 
                 {
                   if (_formkey.currentState.validate()) {
                  _formkey.currentState.save(); }
                  setState(() {
                    _isEditable = false;
                  });
                 },
                 icon : Icon(
                   Icons.check
                 ),
                 label: Text("Save"),
                 color: Colors.amber,
              ),
              RaisedButton.icon(
                 onPressed: () 
                 {
                  setState(() {
                  _isEditable = false;
                  });
                 },
                 icon : Icon(
                   Icons.close
                 ),
                 label: Text("Cancel"),
                 color: Colors.amber,
              ),
          ],
          ),
        ),
      ),
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
                          new Text("${widget._data.eventName}",style: new TextStyle(fontSize:30.0,),textAlign: TextAlign.left,),
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
                                    title: Text("Venue"),
                                    subtitle: Text("${widget._data.venue}"),
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
                                    title: Text("Time"),
                                    subtitle: Text("${widget._data.time}"),
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
                                    title: Text("Description"),
                                    subtitle: Text("${widget._data.description}"),
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
