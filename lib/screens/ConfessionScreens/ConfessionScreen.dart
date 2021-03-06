import 'package:flutter/material.dart';
import 'package:project_map/model/confession_class.dart';
import '../../constants.dart';
import '../../services/data_service.dart';

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
    return FutureBuilder<List<Confession>>(
        future: dataService.getConfessionList(),
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
          key: Key(_data[index].subject),
          background: Container (
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon (
              Icons.delete,
              color: Colors.white,
            )
            ),
          confirmDismiss: (direction) {
            if (direction == DismissDirection.endToStart ) {
              dataService.deleteConfession(
                  id: _data[index].id); 
            setState(() {
              _data.removeAt(index);
            });
            Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Confession dismissed")));
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