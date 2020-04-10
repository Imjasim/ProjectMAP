import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

class Logout extends StatefulWidget {
 Logout({Key key, this.title}) : super(key: key);

  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Logout> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Are you sure you want to log out ? "),
        ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                 RaisedButton(child:Text("YES"), 
                 
                      onPressed: (){
                        showDialog(context: context,
                          builder : (BuildContext context ){
                            return AlertDialog (
                              title: Text("You have sucessfully Logged out "),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Close"),
                                      onPressed: (){
                                        Navigator.pushReplacementNamed(
                                          context,
                                            "/Login");
                                      })
                                  ],
                                    );
                                        }
                                          );
                                            },
                                              ),
                                  const SizedBox(width: 20.0),            
                  RaisedButton(child:Text("NO "), 
                      onPressed: (){
                                    Navigator.pushReplacementNamed(
                                          context,
                                            "/main");
                                            },
                                              )
                                                 ],
                                                    ),
                                                      ),
                                                        );
                                                          }
                                                            }
