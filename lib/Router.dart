import 'package:flutter/material.dart';
import 'package:project_map/main.dart';
import 'package:project_map/model/mock_data.dart';
import 'package:project_map/screens/ConfessionScreens/ConfessionScreen.dart';
import 'package:project_map/screens/SalesScreens/SellingScreen.dart';
import 'package:project_map/screens/Home.dart';
import 'package:project_map/screens/Profile.dart';
import 'package:project_map/screens/Settings.dart';
import 'package:project_map/screens/Login.dart';
import 'package:project_map/screens/Logout.dart';
import 'package:project_map/screens/ConfessionScreens/ConfessionDetailScreen.dart';
import 'package:project_map/screens/SalesScreens/SellingDetailScreen.dart';
import 'package:project_map/screens/EventScreens/EventDetailScreen.dart';
import 'forms/confessionnForm.dart';
import 'package:project_map/screens/EventScreens/EventScreen.dart';
import 'forms/EventForm.dart';
import 'forms/SalesForm.dart';
//import 'services/data_service.dart';

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
        builder: (context) => ConfessionScreen(confessionsData),
      );

      case eventRoute:
      return MaterialPageRoute(
        builder: (context) => EventScreen(eventsData),
      );

      case sellingRoute:
      return MaterialPageRoute(
        builder: (context) => SellingScreen(salesData),
      );

      case sellingRoute:
      return MaterialPageRoute(
        builder: (context) => Logout(),
      );

      case confessionForm:
      return MaterialPageRoute(
        builder: (context) => NewConfessionForm(),
      );

      case eventForm:
      return MaterialPageRoute(
        builder: (context) => NewEventForm(),
      );

      case salesForm:
      return MaterialPageRoute(
        builder: (context) => NewSalesForm(),
      );

      case confessionDetailsRoute:
      return MaterialPageRoute(
        builder: (context) => ConfessionDetailScreen(settings.arguments)
      );

      case eventDetailsRoute:
      return MaterialPageRoute(
        builder: (context) => EventDetailScreen(settings.arguments['_data'], settings.arguments['editable'])
      );

      case sellingDetailsRoute:
      return MaterialPageRoute(
        builder: (context) => SellingDetailScreen(settings.arguments['_data'], settings.arguments['editable'])
      );

      /*case servicesRoute:
      return MaterialPageRoute(
        builder: (context) => DataService()
      );*/
  }
  return null;
}
