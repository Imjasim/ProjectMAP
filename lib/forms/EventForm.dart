import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:project_map/model/mock_data.dart';


class EventForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
  {
    return EventFormState();
  }
}

class EventFormState extends State<EventForm>{

  //String picture;
  String title;
  String description;

  final myController= TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void dispose()
  {
    myController.dispose();
    super.dispose();
  }
  //Widget _buildpicture(){
   //   return null;
  //}
  
  Widget _buildtitle(){
      return TextFormField(
        //controller: myController,
        decoration: InputDecoration(labelText: 'Title'),
        validator: (String value){
        if(value.isEmpty){
        return 'Title is required';
        }
        },
        onSaved: (String value)
        {
           return title = value;
        },
         
        );
  }
  Widget _builddescription(){
     return Scaffold(
       body: Container(
          margin: EdgeInsets.all(8.0),
  // hack textfield height
      padding: EdgeInsets.only(bottom: 40.0),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Description'),
        validator: (String value){
        if(value.isEmpty){
        return 'Description is required';
        }
        },
        onSaved: (String value)
        {
           return description = value;
        },
         
       )
     ),
     );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title : Text("Form")),
      body:Container(
        margin : EdgeInsets.all(24),
        child : Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
           // _buildpicture(),
            _buildtitle(),
            _builddescription(),
            SizedBox(height:100),
            RaisedButton(
              child: Text('Post',style: TextStyle(color: Colors.blue, fontSize: 16,),
              ),
              onPressed: ()  {
                if(!_formkey.currentState.validate()){
                  return;
                   //Scaffold.of(context) .showSnackBar(SnackBar(content: Text('Event Posted ')));
                }
                if (_formkey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Confession Posted ')));
                }
                //print(title);
                //print(description);
                setState(() {
                  //events_data.addAll( ,desctipion);
                  //events_data.update(title,description);
                  //events_data.add(this.title,this.description);
                });

              },)
          ],
          ),
        ),
      ),
    );
  }
}
