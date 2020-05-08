import 'package:flutter/material.dart';
import '../constants.dart';


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
        backgroundColor: Colors.pink[900],
        ),
          body:  Container (
          color: Colors.pink[600],
          child: Center(
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
                                  Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (Route<dynamic> route) => false);
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
                  //Navigator.pushReplacementNamed(context,mainPage);
                  Navigator.pop(context);
                  },
                 )
                ],
               ),
              ),
            ),
          );
        }
       }
