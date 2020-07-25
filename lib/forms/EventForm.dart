import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_map/model/mock_data.dart';
import 'package:project_map/model/event_class.dart';
import '../constants.dart';
import '../services/data_service.dart';


class NewEventForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Event Form ';
   

    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: currentTheme.appBar
        ),
        body: EventForm(),
    );
  }
}


class EventForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
  {
    return EventFormState();
  }
}

class EventFormState extends State<EventForm>{
    final editText1 =TextEditingController() ;
    final editText2 =TextEditingController() ;
    final editText3 =TextEditingController() ;
    final editText4 =TextEditingController() ;
  Event newEvent ;

  final myController= TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  
  @override
  Widget build(BuildContext context){
    return Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
           TextFormField(
        controller: editText1,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Event Name '),
        validator: (value){
            if (value.isEmpty){
              return "Event Name is required" ;
            }
            return null ; 
          }
        ),
        TextFormField(
        controller: editText2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Venue'),
        validator: (value){
            if (value.isEmpty){
              return "Venue is required" ;
            }
            return null ; 
          }
        ),
          TextFormField(
        controller: editText3,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Time'),
        validator: (value){
            if (value.isEmpty){
              return "Time is required" ;
            }
            return null ; 
          }
        ),
        TextFormField(
        controller: editText4,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Description'),
        validator: (value){
            if (value.isEmpty){
              return "Description is required" ;
            }
            return null ; 
          }
        ),
         SizedBox(height:100),
          RaisedButton.icon(
                 onPressed: () 
                 {
                   if (_formKey.currentState.validate()) {
                  newEvent = new Event('001', editText1.text, editText2.text ,editText3.text,editText4.text);
                  dataService.createEvent(
            event: newEvent,);
                  eventsData.add(newEvent); 
                  Navigator.of(context).pop(eventsData);
                  }
                 },
                 icon : Icon(
                   Icons.check
                 ),
                 label: Text("Submit"),
                 color: Colors.amber,
              ),
              RaisedButton.icon(
                 onPressed: () 
                 {
                   Navigator.of(context).pop(null);
                 },
                 icon : Icon(
                   Icons.close
                 ),
                 label: Text("Cancel"),
                 color: Colors.amber,
              ),
          ],
          ),
        );
  }
}
