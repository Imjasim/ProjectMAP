import 'package:flutter/material.dart';
import 'package:project_map/model/event_class.dart';
import '../../constants.dart';

class EventScreen extends StatefulWidget {
  final List _data;

  EventScreen(this._data);

  

  @override
  EventScreenState createState(){
    return EventScreenState(_data);
  }
}

class EventScreenState extends State<EventScreen> {
  List _data;

  EventScreenState(this._data);

//navigation method when user clicks on the add button
  void _navigateAdd() async {
    final returnData = await Navigator.pushNamed(
      context,eventForm);

    if (returnData != null) {
      setState(() => _data = returnData);
    }
  }

  //navigation method when user clicks on the content tile
  void _navigateEdit(List events,int index) async {
    final returnData = await Navigator.pushNamed(context, eventDetailsRoute, 
          arguments: Event.copy(events[index]));

    if (returnData != null) {
      if (returnData ==1){
        setState(() => events.removeAt(index));
      }
      else{
      setState(() => events[index] = returnData);
      }
    }
  }

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
        itemBuilder: (context, index) => _listTile(
          index,
          _data,
        ),
        separatorBuilder: (context, index) => Divider(
          //color: Colors.grey,
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
              label: const Text(''),
              icon: const Icon(Icons.add_circle),
              heroTag: null,
              onPressed: () => _navigateAdd(),
            ),
    );
  }

  Widget _listTile (index,events) {
    return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: ListTile(
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(events[index].eventName),
          subtitle: Text(events[index].description),
          onTap: () => _navigateEdit(events, index),
        ),
  );
  }

}