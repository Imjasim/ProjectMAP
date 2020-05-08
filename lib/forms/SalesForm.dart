import 'package:flutter/material.dart';
import 'package:project_map/model/mock_data.dart';
import 'package:project_map/model/sales_class.dart';


class NewSalesForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Sales Form ';
   

    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.pink[900],
        ),
        body: SalesForm(),
    );
  }
}


class SalesForm extends StatefulWidget {
  @override
  SalesFormState createState() {
    return SalesFormState();
  }

}

class SalesFormState extends State<SalesForm>{
  final editText1 =TextEditingController() ;
  final editText2 =TextEditingController() ; 
  final editText3 =TextEditingController() ;

  Sales newSales;

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
        decoration: InputDecoration(labelText: 'Product Name'),
        validator: (value){
            if (value.isEmpty){
              return "Product Name is required" ;
            }
            return null ; 
          }
        ),
        TextFormField(
        controller: editText2,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Product Price'),
        validator: (value){
            if (value.isEmpty){
              return "Product Price is required" ;
            }
            return null ; 
          }
        ),
        TextFormField(
        controller: editText3,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(labelText: 'Product Description'),
        validator: (value){
            if (value.isEmpty){
              return "Product Description is required" ;
            }
            return null ; 
          }
        ),
         SizedBox(height:100),
          RaisedButton.icon(
                 onPressed: () 
                 {
                   if (_formKey.currentState.validate()) {
                  newSales = new Sales( editText1.text, editText2.text, editText3.text);
                  salesData.add(newSales); 
                  Navigator.of(context).pop(salesData );
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
