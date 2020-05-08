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

