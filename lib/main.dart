import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Settings.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Login.dart';
import 'Logout.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "/main": (_) => MyApp(),
        "/splash": (_) => MYsplash(),
        "/Logout": (_) => Logout(),
        "/Login": (_) => Login(),
      },
));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState(){
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 1;
  final _pageOptions = [
    Settings(),
    Home(),
    Profile(),
  ];

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
          child: _pageOptions[_selectedPage],
        ),

        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
        backgroundColor: Colors.pink[600],
        color: Colors.pink[900],
        buttonBackgroundColor: Colors.orange,
        items: <Widget>[
          Icon(Icons.settings, size: 30),
          Icon(Icons.home, size: 50),
          Icon(Icons.person, size: 30),
        ],
       animationDuration: Duration(
         milliseconds: 500
        ),
       animationCurve: Curves.ease,
        onTap: (index) {
                setState(() {
                _selectedPage = index;
             });
          },
       ),
    );
  }
}

class MYsplash extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MYsplash> {

  @override
  void initState() {
    
    super.initState();
    Future.delayed
    (Duration(seconds: 3),
    (){
      Navigator.pushReplacementNamed(context, "/main" );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/logo.png"),
            fit: BoxFit.cover,
          )
        ],
      ),
    );
}
}
