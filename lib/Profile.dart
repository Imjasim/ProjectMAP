import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
           backgroundColor: Colors.pink[900], 
          ),
        
        body: Container (
          color: Colors.pink[600],
          child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSansPro',
                    color: Colors.white,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Text(""),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'NUR NABILA BINTI ZAKARIA',
                      style: TextStyle(fontSize: 17.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.keyboard,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'A17CS0159 (Student)',
                      style: TextStyle(fontSize: 17.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.school,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'Faculty of Engineering',
                      style: TextStyle(fontSize: 17.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      'nabilazakaria13@gmail.com',
                      style: TextStyle(fontSize: 17.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),

                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        '+60123456789',
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 17.0),
                      ),
                    )
                    ),

              ],
            ),
          ),
        ),
         
      ),
    );
  }
}