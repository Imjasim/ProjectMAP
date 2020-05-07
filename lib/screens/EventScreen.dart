import 'package:flutter/material.dart';
import 'package:project_map/model/event_class.dart';
import '../constants.dart';



class EventScreen extends StatelessWidget {
  final List _data;

  EventScreen(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: Colors.pink[900],
        ),
        body: Container (
          color: Colors.pink[600],
          child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          confessions: _data,
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
              label: const Text(''),
              icon: const Icon(Icons.add_circle),
              heroTag: null,
              onPressed: () => Navigator.pushNamed(context, eventForm),
            ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final int index;
  final List<Event> confessions;

  _ListTile({this.index, this.confessions});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
     await Navigator.pushNamed(context, detailsRoute,
        //arguments: Assessment.copy(widget.assessements[widget.index])
        );

  }

  @override
  
  Widget build(BuildContext context) {
      return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell (
          onTap: () {},
        child: ListTile(
	
          leading: Icon(Icons.leak_remove, size: 50),
          title: Text(widget.confessions[widget.index].eventName),
          subtitle: Text(widget.confessions[widget.index].description),
          onTap: () => _navigate(),
        ),
        ),
      ],
    ),
  );
  }
}