import 'package:flutter/material.dart';
import 'model/user_class.dart';

const String homeRoute = '/';
const String mainPage = '/main';
const String homepageRoute = '/Home';
const String profileRoute = '/Profile';
const String settingsRoute = '/Settings';
const String loginRoute = '/Login';
const String logoutRoute = '/Logout';
const String splashRoute = '/splash';
const String confessionRoute = '/confession';
const String sellingRoute = '/selling';
const String eventRoute = '/event';
const String confessionDetailsRoute = '/confessionDetailsPage';
const String eventDetailsRoute = '/eventDetailsPage';
const String sellingDetailsRoute = '/sellingDetailsPage';
const String confessionForm = '/confessionForm';
const String eventForm = '/EventForm';
const String salesForm = '/SalesForm';
const String servicesRoute = '/services';

//Constants for theme colour
MyTheme currentTheme = MyTheme ('Red', Colors.pink[600], Colors.orange, Colors.pink[900]);

class MyTheme {
  Color back; //Colour for app background and above the icon in navigation bar
  Color appBar; //colour for app bar and bottom navigation bar
  Color navi; //Colour for the icon in navigation bar
  String name; //Name of the theme to display

  MyTheme (this.name, this.back, this.navi, this.appBar);
}
  List<MyTheme> myThemes = [
    MyTheme ('Red', Colors.pink[600], Colors.orange, Colors.pink[900]),
    MyTheme ('Blue', Colors.blue[600], Colors.green, Colors.blue[900])
  ];

//Logged in user session
User loggedIn;
//Class for 3 dot menu 
class DotMenu {
  static const String edit = 'Edit'; 
  static const String delete = 'Delete'; 
  
  static const List<String> eventsMenu = <String> [
    edit, delete
  ];

  static const List<String> confessionsMenu = <String> [
    delete
  ];
}

