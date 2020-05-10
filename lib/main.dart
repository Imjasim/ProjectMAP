import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'screens/Settings.dart';
import 'screens/Home.dart';
import 'screens/Profile.dart';
//import 'screens/Login.dart';
//import 'screens/Logout.dart';
import 'Router.dart';
import 'constants.dart';


void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: //confessionForm,
      //confessionRoute,
      mainPage,
      //loginRoute,
      onGenerateRoute: createRoute,
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
        backgroundColor: currentTheme.appBar
        ),
        body: Container (
          color: currentTheme.back,
          child: _pageOptions[_selectedPage],
        ),

        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
        backgroundColor: currentTheme.back,
        color: currentTheme.appBar,
        buttonBackgroundColor: currentTheme.navi,
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


//Class for splash screen
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
      Navigator.pushReplacementNamed(context, mainPage );
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