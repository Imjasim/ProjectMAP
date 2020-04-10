import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  SettingsPage createState(){
    return SettingsPage();
  }
}


class SettingsPage extends State<Settings> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.pink[600],
        body: Container (
          //color: Colors.pink[600], 
        
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
          _buildSwitch('Receive Notification'),
          _buildSwitch('Receive Newsletter'),
          const SizedBox(height: 20.0),
          Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        _buildTile("Change Password", Icons.lock_outline,Icons.keyboard_arrow_right),
                        _buildDivider(),
                        _buildTile("Change Password", Icons.lock_outline,Icons.keyboard_arrow_right),
                        _buildDivider(),
                        _buildTile("Change Password", Icons.lock_outline,Icons.keyboard_arrow_right),
                        
                      ],
                    ),
                  ),
          ],
        ),
       ),
      ),
    );
  }

  Widget _buildSwitch (text) {
    return SwitchListTile(
            title: Text(text),
            value: _lights,
            onChanged: (val) {} ,
            //secondary: const Icon(Icons.lightbulb_outline),
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