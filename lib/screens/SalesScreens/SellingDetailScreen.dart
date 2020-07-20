import 'package:flutter/material.dart';
import 'package:project_map/model/sales_class.dart';
import '../../constants.dart';
import '../../services/data_service.dart';


class SellingDetailScreen extends StatefulWidget {
  final Sales _data;
  final bool editable;

  SellingDetailScreen(this._data, this.editable);

  

  @override
  SellingDetailScreenState createState(){
    return SellingDetailScreenState(editable);
  }
}

class SellingDetailScreenState extends State<SellingDetailScreen> {
  SellingDetailScreenState(this._isEditable);
  bool _isEditable;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context,widget._data);}
        ),
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: currentTheme.appBar,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (context) {
            return DotMenu.eventsMenu.map((String menu) {
            return PopupMenuItem<String> (
            value: menu,
            child: Text(menu),
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
  Widget _buildtitle(){
    final editText1 =TextEditingController() ;
    final editText2 =TextEditingController() ;
    final editText3 =TextEditingController() ;
    editText1.text=widget._data.prodName;
    editText2.text=widget._data.prodPrice;
    editText3.text=widget._data.prodDesc;

      return Column(
        children: <Widget>[ 
          TextFormField(
        controller: editText1,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Product Name'),
        validator: (String value){
        if(value.isEmpty){
        return 'Selling INFO is required';
        }
        return null;
        },
        onSaved: (String value)
        {
          widget._data.prodName = value;
        },
        ),
        TextFormField(
        controller: editText2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Product Price'),
        validator: (String value){
        if(value.isEmpty){
        return 'Selling INFO is required';
        }
        return null;
        },
        onSaved: (String value)
        {
          widget._data.prodPrice = value;
        },
        ),
        TextFormField(
        controller: editText3,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Product Description'),
        validator: (String value){
        if(value.isEmpty){
        return 'Selling INFO is required';
        }
        return null;
        },
        onSaved: (String value)
        {
          widget._data.prodDesc = value;
          Sales newSales = new Sales( widget._data.id, editText1.text, editText2.text, editText3.text);
          dataService.updateSalesStatus(id:  widget._data.id, sales: newSales);
        },
        ),
        ],
        );
  }

 //Implement two buttons to save and cancel the changes made to the content of the sales
  Widget editable() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
        margin : EdgeInsets.all(24),
        child : Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
            _buildtitle(),
            SizedBox(height:100),
               RaisedButton.icon(
                 onPressed: () 
                 {
                   if (_formkey.currentState.validate()) {
                  _formkey.currentState.save(); 
                  setState(() {
                    _isEditable = false;
                  });
                   }
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
