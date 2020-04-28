import 'package:flutter/material.dart';
import 'package:project_map/screens/Confession.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
        body: Container (
          color: Colors.pink[600],
          child: Column(
          children: <Widget> [
            _ListTile('Confession', 'Place to inform'),
            _ListTile('Selling', 'Place to promote goods and foods'),
            _ListTile('Event', 'Place to know what is happening around UTM'),
            ]
          ),
        ),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final String title;
  final String desc; 
  _ListTile(this.title, this.desc);

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  
  Widget build(BuildContext context) {
      return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell (
          onTap: () {},
        child: ListTile(
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(widget.title),
          subtitle: Text(widget.desc),
          onTap:() {
                        Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Confession(),
                  ),
            );
                      },
        ),
        ),
      ],
    ),
  );
  }
}