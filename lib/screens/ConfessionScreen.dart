import 'package:flutter/material.dart';
import 'package:project_map/model/confession_class.dart';
import '../constants.dart';

class ConfessionScreen extends StatefulWidget {
  final List _data;

  ConfessionScreen(this._data);

  

  @override
  ConfessionScreenState createState(){
    return ConfessionScreenState(_data);
  }
}

class ConfessionScreenState extends State<ConfessionScreen> {
  List _data;

  ConfessionScreenState(this._data);

  void _navigateAdd() async {
    final returnData = await Navigator.pushNamed(
      context,confessionForm);

    if (returnData != null) {
      setState(() => _data = returnData);
    }
  }

  void _navigateEdit(List confessions,int index) async {
    final returnData = await Navigator.pushNamed(context, confessionDetailsRoute, 
          arguments: Confession.copy(confessions[index]));

    if (returnData != null) {
      if (returnData ==1){
        setState(() => confessions.removeAt(index));
      }
      else{
      setState(() => confessions[index] = returnData);
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

  Widget _listTile (index,confessions) {
    return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: ListTile(
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(confessions[index].username),
          subtitle: Text(confessions[index].subject),
          onTap: () => _navigateEdit(confessions, index),
        ),
  );
  }

}



  /*class _ListTile extends StatefulWidget {
  final int index;
  final List<Confession> confessions;

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
          title: Text(widget.confessions[widget.index].username),
          subtitle: Text(widget.confessions[widget.index].subject),
          onTap: () => _navigate(),
        ),
        ),
      ],
    ),
  );
  }
}*/
