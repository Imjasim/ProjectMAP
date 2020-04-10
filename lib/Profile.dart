import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
          body: Container (
          color: Colors.pink[600],
          child: Center(
          child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('images/profile1.jpg'),
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 15,
                    letterSpacing: 2.0,                   
                  ),
                ),
                Text(
                  'STUDENT',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSansPro',
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(
                  height: 13.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'NUR NABILA BINTI ZAKARIA',
                      style: TextStyle(fontSize: 13.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.keyboard,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'A17CS0159',
                      style: TextStyle(fontSize: 13.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'School of Computing',
                      style: TextStyle(fontSize: 13.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'nabilazakaria13@gmail.com',
                      style: TextStyle(fontSize: 13.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        '+60123456789',
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 13.0),
                      ),
                    )
                    ),

                    RaisedButton(
                      onPressed:() {
                        Navigator.pushReplacementNamed(context, "/Logout" );
                      },
                  color: Colors.pink[900],
                  
                  child: ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 15.0, fontFamily: 'Neucha', color: Colors.white),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
         
      ),
    );
  }
}