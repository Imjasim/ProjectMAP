import 'package:flutter/material.dart';
//import 'package:project_map/screens/Confession.dart';
import '../constants.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState(){
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
        body: Container (
          color: Colors.pink[600],
          child: Column(
          children: <Widget> [
            _listTile('Confession', 'Place to inform', confessionRoute),
            _listTile('Selling', 'Place to promote goods and foods', sellingRoute),
            _listTile('Event', 'Place to know what is happening around UTM', eventRoute),
            ]
          ),
        ),
      ),
    );
  }

  Widget _listTile (title, desc, route) {
    return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: ListTile(
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(title),
          subtitle: Text(desc),
          onTap: () { Navigator.pushNamed(context, route);}
        ),
  );
  }
}



/*class _ListTile extends StatefulWidget {
  final String title;
  final String desc; 
  final String route;
  _ListTile(this.title, this.desc, this.route);

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {

  @override
  
  Widget build(BuildContext context) {
      return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: ListTile(
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(widget.title),
          subtitle: Text(widget.desc),
          onTap: () { Navigator.pushNamed(context, logoutRoute);
        }
        ),
  );
  }
}*/