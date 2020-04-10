import 'package:flutter/material.dart';



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
            _buildContent('Confession', 'Place to inform'),
            _buildContent('Selling', 'Place to promote goods and foods'),
            _buildContent('Event', 'Place to know what is happening around UTM'),
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
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(title),
          subtitle: Text(desc),
        ),
        ),
      ],
    ),
  );
  }

}