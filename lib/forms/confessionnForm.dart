import 'package:flutter/material.dart';
import 'package:project_map/model/mock_data.dart';
import 'package:project_map/model/confession_class.dart';


class NewConfessionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Confession Form ';

    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
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

  getPosts() {}
}

class ConfessionFormState extends State<ConfessionForm>{
  final newText =TextEditingController() ; 
  Confession newConfession;

  final _formKey =GlobalKey <FormState>() ; 
  @override
  Widget build(BuildContext context) {
    return Form(
      key : _formKey , 
      child : Column(
        crossAxisAlignment:
      CrossAxisAlignment.start,
      children: <Widget>[

        TextFormField(
          controller: newText,
          validator: (value){
            if (value.isEmpty){
              return "Please enter your confession" ;
            }
            return null ; 
          }
        ),

            Padding(
            padding: const 
            EdgeInsets.symmetric(vertical: 16.0),
            child:Row(
               crossAxisAlignment:
      CrossAxisAlignment.start,
      children: <Widget>[

              RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Confession Posted ')));
                      newConfession = new Confession('Jasim', newText.text, 'Testing');
                  confessions_data.add(newConfession);
                  Navigator.of(context).pop(confessions_data);
                }
              },
              child: Text('Submit'),
            ),
           
      ]
            )
             
            
          ),
        

      ]
      
      ) 
      
     
    );
    
  }
}
