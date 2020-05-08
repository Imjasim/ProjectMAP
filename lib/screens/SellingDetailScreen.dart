import 'package:flutter/material.dart';
import 'package:project_map/model/sales_class.dart';
import '../constants.dart';

class SellingDetailScreen extends StatefulWidget {
  final Sales _data;

  SellingDetailScreen(this._data);

  

  @override
  SellingDetailScreenState createState(){
    return SellingDetailScreenState();
  }
}

class SellingDetailScreenState extends State<SellingDetailScreen> {
  bool _isEditable = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  /*void initState() {
    //editText.text=widget._data.prodName;
    return super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: Colors.pink[900],
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (context) {
            return DotMenu.eventsMenu.map((String eventMenu) {
            return PopupMenuItem<String> (
            value: eventMenu,
            child: Text(eventMenu),
          );
            }).toList();
            },
          ),
        ],
        ),
      body: _isEditable ?
      editable() :
      nonEditable() 
    );
  }

//Choices for 3 dot menu
  void choiceAction (String choice) {
    if (choice == DotMenu.edit) {
      setState(() {
        _isEditable = true;
      });
    }
    else if (choice == DotMenu.delete) {
      Navigator.pop(context,1);
    }
  }

//Editable section for products
  Widget _buildtitle(text,label){
    final editText =TextEditingController() ;
    editText.text=text;
      return TextFormField(
        controller: editText,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: label),
        validator: (String value){
        if(value.isEmpty){
        return 'Selling INFO is required';
        }
        },
        onSaved: (String value)
        {
          //title = value;
        },
        );
  }

  Widget editable() {
    return Scaffold(
      body:Container(
        margin : EdgeInsets.all(24),
        child : Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
           // _buildpicture(),
            _buildtitle(widget._data.prodName, 'Product Name'),
            _buildtitle(widget._data.prodPrice, 'Product Price'),
            _buildtitle(widget._data.prodDesc, 'Product Description'),
           // _builddescription(),
            SizedBox(height:100),
               RaisedButton.icon(
                 onPressed: () 
                 {

                 },
                 icon : Icon(
                   Icons.check
                 ),
                 label: Text("Save"),
                 color: Colors.amber,
              ),
              RaisedButton.icon(
                 onPressed: () { 
                   setState(() {
                  _isEditable = false;
                  });
                },
                 icon : Icon(
                   Icons.close
                 ),
                 label: Text("Cancel"),
                 color: Colors.amber,
              ),
          ],
          ),
        ),
      ),
    );
      //Implement two buttons to save and cancel the changes made to the content of the confession
  }

  //Noneditable section for products
  Widget nonEditable () {
    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                     Row( 
                        children: <Widget>[
                          new Text("Details",style: new TextStyle(fontSize:30.0,),textAlign: TextAlign.left,),
                        ],
                        ),  
                         Row( 
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0xEE03A2)
                              ),
                              child: new Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Name"),
                                    subtitle: Text("${widget._data.prodName}"),
                                  ),
                                ],),
                               )
                               ),
                           new Expanded(
                             child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0xEE03A2)
                              ),
                              child: new Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Price"),
                                    subtitle: Text("${widget._data.prodPrice}"),
                                  ),
                                ],),
                               )
                               ),
                        ],
                        ), 
                          Row( 
                        children: <Widget>[
                          new Expanded(
                            child: new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0x03EEEE)
                              ),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Description"),
                                    subtitle: Text("${widget._data.prodDesc}"),
                                  ),
                                ],),
                               )
                               ),
                    ],
                  ), 
                 ],
                ),
                ),
               ],
            ),
          ),
        );
  }
}
