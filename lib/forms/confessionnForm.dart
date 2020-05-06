import 'package:flutter/material.dart';


class NewConfessionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Confession Form ';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ConfessionForm(),
      ),
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
                }
              },
              child: Text('Submit'),
            ),
            RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Confession Posted ')));
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
