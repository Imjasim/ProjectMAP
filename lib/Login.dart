

import 'package:flutter/material.dart';





void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
      

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}
   
    class  _MyCustomFormState extends State<MyCustomForm> {
    
    final myController =TextEditingController() ; 
    final myController2 =TextEditingController();
    @override
    void dispose () {
      myController.dispose() ;
      myController2.dispose() ; 
      super.dispose(); 
    }

      @override
      
      Widget build(BuildContext context) {
        
        
        final emailField = TextField(
          controller: myController,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Enter your email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final  passwordField = TextField(
          controller: myController2,
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "Enter your Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
          /*void someFunction(){
              var   user1 = 'user1'     ;
      
      
                if ( myController.text == user1 ) {
                    Navigator.pushReplacementNamed(
              context,
              "/splash");
              } 
          }*/
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
                if ( myController.text == "u1" && myController2.text =="u2" ){
                   Navigator.pushReplacementNamed(
              context,
              "/splash");
                } else {
                    Navigator.pushReplacementNamed(
              context,
              "/Login");
                }
          
            
           
          },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        return Scaffold(
          body: Center(
            child: Container( 
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }


    
/*class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: Center(
          child: Text('This is just a dummy Login page'),
          ),
          floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        label: Text('Login'),
        backgroundColor: Colors.blue,
        icon: Icon(Icons.verified_user),
        ),
      ),
    );
  }
} */

