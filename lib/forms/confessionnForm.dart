import 'package:flutter/material.dart';
import 'package:project_map/model/mock_data.dart';
import 'package:project_map/model/confession_class.dart';


class NewConfessionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Confession Form ';
   

    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.pink[900],
        ),
        body: ConfessionForm(),
    );
  }
}


class ConfessionForm extends StatefulWidget {
  @override
  ConfessionFormState createState() {
    return ConfessionFormState();
  }

}

class ConfessionFormState extends State<ConfessionForm>{
  final editText1 =TextEditingController() ;
    final editText2 =TextEditingController() ; 
  Confession newConfession;

  final _formKey =GlobalKey <FormState>() ; 
  @override
  Widget build(BuildContext context) {
    return Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
           TextFormField(
        controller: editText1,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Subject '),
        validator: (value){
            if (value.isEmpty){
              return "Subject is required" ;
            }
            return null ; 
          }
        ),
        TextFormField(
        controller: editText2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Confession'),
        validator: (value){
            if (value.isEmpty){
              return "Confession is required" ;
            }
            return null ; 
          }
        ),
         SizedBox(height:100),
          RaisedButton.icon(
                 onPressed: () 
                 {
                   if (_formKey.currentState.validate()) {
                  newConfession = new Confession('Liknesh', editText1.text, editText2.text);
                  confessionsData.add(newConfession); 
                  Navigator.of(context).pop(confessionsData);
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
