import 'package:flutter/material.dart';
import 'package:project_map/main.dart';
import 'package:project_map/model/mock_data.dart';
import 'package:project_map/screens/ConfessionScreen.dart';
import 'package:project_map/screens/Home.dart';
import 'package:project_map/screens/Profile.dart';
import 'package:project_map/screens/Settings.dart';
import 'package:project_map/screens/Login.dart';
import 'package:project_map/screens/Logout.dart';
import 'forms/confessionnForm.dart';
import 'package:project_map/screens/EventScreen.dart';
import 'forms/EventForm.dart';

import 'constants.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    //case homeRoute:
    case mainPage: 
      return MaterialPageRoute(
        builder: (context) => MyApp(),
      );

    case splashRoute: 
      return MaterialPageRoute(
        builder: (context) => MYsplash(),
      );  
      
    case homepageRoute:
      return MaterialPageRoute(
        builder: (context) => Home(),
      );

    case profileRoute:
      return MaterialPageRoute(
        builder: (context) => Profile(),
      );

      case settingsRoute:
      return MaterialPageRoute(
        builder: (context) => Settings(),
      );

      case loginRoute:
      return MaterialPageRoute(
        builder: (context) => Login(),
      );

      case logoutRoute:
      return MaterialPageRoute(
        builder: (context) => Logout(),
      );

      case confessionRoute:
      return MaterialPageRoute(
        builder: (context) => ConfessionScreen(confessions_data),
      );

      case sellingRoute:
      return MaterialPageRoute(
        builder: (context) => Logout(),
      );

      case eventRoute:
      return MaterialPageRoute(
        builder: (context) => EventScreen(events_data),
      );

      case confessionForm:
      return MaterialPageRoute(
        builder: (context) => NewConfessionForm(),
      );

      case eventForm:
      return MaterialPageRoute(
        builder: (context) => EventForm(),
      );
  }
  return null;
}
