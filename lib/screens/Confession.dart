import 'package:flutter/material.dart';



class Confession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
        body: Container (
          color: Colors.pink[600],
          child: Column(
          children: <Widget> [
            _buildContent('My Username', 'Description of the post'),
            ]
          ),
        ),
      ),
    );
  }


  Widget _buildContent(title,desc) {
      return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell (
          onTap: () {},
        child: ListTile(
	
          //leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(title),
          subtitle: Text(desc),
        ),
        ),
      ],
    ),
  );
  }

}
