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
          color: currentTheme.back,
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

//To display options provide for user to view
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