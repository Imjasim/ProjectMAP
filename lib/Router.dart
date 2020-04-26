import 'package:flutter/material.dart';
import 'package:project_map/screens/Home.dart';
import 'package:project_map/screens/Profile.dart';
import 'package:project_map/screens/Settings.dart';
import 'package:project_map/screens/Login.dart';
import 'package:project_map/screens/Logout.dart';

import 'constants.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case homeRoute:
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
  }
  return null;
}