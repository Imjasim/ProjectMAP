import 'package:flutter/material.dart';
import 'package:project_map/model/user_class.dart';
import '../constants.dart';
import '../services/data_service.dart';

class Profile extends StatefulWidget {
  //final List _data;

  Profile();

  

  @override
  ProfileState createState(){
    return ProfileState();//_data);
  }
}

class ProfileState extends State<Profile> {
  

  //ProfileState();//this._data);

  
 Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: dataService.getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List _data = snapshot.data;
            return _buildMainScreen();
          }
          return _buildMainScreen();
        });
  } 
    //return MaterialApp(
     // debugShowCheckedModeBanner: false,

     Scaffold _buildMainScreen() {

    return Scaffold(
          body: Container (
          color: currentTheme.back,
          child: Center(
          child: ListView(
              children: <Widget>[
                CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('images/profile1.jpg'),
                ),
                SizedBox(
                  height: 13.0,
                  width: 200,
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
                _buildCard ('NUR NABILA BINTI ZAKARIA', Icons.person),
                _buildCard ('A17CS0159', Icons.keyboard),
                _buildCard ('School of Computing', Icons.school),
                _buildCard ('nabilazakaria13@gmail.com', Icons.email),
                _buildCard ('+60123456789', Icons.phone),
              
                 RaisedButton(
                      onPressed:() {
                        Navigator.pushNamed(context, logoutRoute);
                      },
                  color: Colors.black,
                  elevation: 10.0,
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
         
    );
  }

  Widget _buildCard (text, icon){
    return Card(
              color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                  child: ListTile(
                    leading: Icon(
                      icon,
                      color: Colors.teal[900],
                    ),
                    title: Text(
                      text,
                      style: TextStyle(fontSize: 13.0, fontFamily: 'Neucha'),
                    ),
                  ),
                );
      }
}