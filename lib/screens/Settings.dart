import 'package:flutter/material.dart';
import '../constants.dart';

class Settings extends StatefulWidget {
  @override
  SettingsPage createState(){
    return SettingsPage();
  }
}


class SettingsPage extends State<Settings> {
  bool _noti = true;
  bool _news = false;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: currentTheme.back,
        body: Container (
          //color: currentTheme.back, 
        
          child: ListView(
            padding: EdgeInsets.only(left: 10.0,top: 10.0),
          children: <Widget> [
             new Text(
                    "Notification Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
          ),
          _buildSwitch('Receive Notification', _noti,'noti'),
          _buildSwitch('Receive Newsletter', _news, 'news'),
          Text(
                    "Theme Settings",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
          ),
          ListTile(
            title: Text('Theme Colour'),
            //subtitle: Text('Select theme colour'),
            trailing: DropdownButton<MyTheme>(
              //value: Theme.
                items: myThemes.map((value) => DropdownMenuItem(
                value: value,
                child: new Text(value.name),
              ),
            ).toList(),
            onChanged: (newValue) =>
          setState(() => currentTheme = newValue),
            ),
          ),
          const SizedBox(height: 20.0),
          Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        _buildTile("Change Email", Icons.email,Icons.keyboard_arrow_right),
                        _buildDivider(),
                        _buildTile("Change Password", Icons.keyboard,Icons.keyboard_arrow_right),
                        _buildDivider(),
                        _buildTile("Privacy Settings", Icons.lock_outline,Icons.keyboard_arrow_right),
                        
                      ],
                    ),
                  ),
          ],
        ),
       ),
      ),
    );
  }



  Widget _buildSwitch (text,_v, id) {
    return SwitchListTile(
            title: Text(text),
            value: _v,
            onChanged: (value)=>setState((){
              if (id == 'noti')
              value=!value;
              else if (id == 'news')
              _news=!value;
            }
            ),
          );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }

  Widget _buildTile (text,iconLeft,iconRight) {
    return ListTile(
                          leading: Icon(
                            iconLeft,
                            color: Colors.purple,
                          ),
                          title: Text(text),
                          trailing: Icon(iconRight),
                          onTap: () {
                            //open change password
                          },
    );
  }
}