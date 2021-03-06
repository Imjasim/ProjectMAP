import 'package:flutter/material.dart';
import 'package:project_map/model/event_class.dart';
import '../../constants.dart';
import '../../services/data_service.dart';


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
  void _navigateEdit(List events,int index, bool edit) async {
    final returnData = await Navigator.pushNamed(context, eventDetailsRoute, 
          arguments: {
            '_data': Event.copy(events[index]),
             'editable': edit},
          );

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
    return FutureBuilder<List<Event>>(
        future: dataService.getEventList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _data = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  } 
  
      Scaffold _buildMainScreen() {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: currentTheme.appBar
        ),
        body: Container (
          color: currentTheme.back,
          child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => Dismissible (
          key: Key(_data[index].eventName),
          background: Container (
            alignment: AlignmentDirectional.centerStart,
            color: Colors.blue,
            child: Icon (
              Icons.edit,
              color: Colors.white,
            )
            ),
            secondaryBackground: Container (
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon (
              Icons.delete,
              color: Colors.white,
            )
            ),
          confirmDismiss: (direction) {
            if (direction == DismissDirection.endToStart ) {
              dataService.deleteEvent(
                  id: _data[index].id); 
            setState(() {
              _data.removeAt(index);
            });
            Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Event dismissed")));
          }
          else if (direction == DismissDirection.startToEnd ) {
            _navigateEdit(_data, index, true);
          }
          return null;
          },
          child: _listTile(
          index,
          _data,
        ),
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
          onTap: () => _navigateEdit(events, index, false),
        ),
  );
  }

Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }

}