import 'package:flutter/material.dart';
import 'package:project_map/model/sales_class.dart';
import '../../constants.dart';

class SellingScreen extends StatefulWidget {
  final List _data;

  SellingScreen(this._data);

  

  @override
  SellingScreenState createState(){
    return SellingScreenState(_data);
  }
}

class SellingScreenState extends State<SellingScreen> {
  List _data;

  SellingScreenState(this._data);

//navigation method when user clicks on the add button
  void _navigateAdd() async {
    final returnData = await Navigator.pushNamed(
      context,salesForm);

    if (returnData != null) {
      setState(() => _data = returnData);
    }
  }

//navigation method when user clicks on the content tile
  void _navigateEdit(List sales,int index) async {
    final returnData = await Navigator.pushNamed(context, sellingDetailsRoute, 
          arguments: Sales.copy(sales[index]));

    if (returnData != null) {
      if (returnData ==1){
        setState(() => sales.removeAt(index));
      }
      else{
      setState(() => sales[index] = returnData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: Colors.pink[900],
        ),
        body: Container (
          color: Colors.pink[600],
          child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) => Dismissible (
          key: Key(_data[index].prodName),
          background: Container (
            alignment: AlignmentDirectional.centerStart,
            color: Colors.blue,
            child: Icon (
              Icons.edit,
              color: Colors.white,
            )
            ),
            secondaryBackground: Container (
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red,
            child: Icon (
              Icons.delete,
              color: Colors.white,
            )
            ),
          confirmDismiss: (direction) {
            if (direction == DismissDirection.endToStart ) {
            setState(() {
              _data.removeAt(index);
            });
            Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Sales dismissed")));
          }
          else if (direction == DismissDirection.startToEnd ) {
            _navigateEdit(_data, index);
          }
          return null;
          },
          child: _listTile(
          index,
          _data,
        ),
        ),
        separatorBuilder: (context, index) => Divider(
          //color: Colors.grey,
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
              label: const Text(''),
              icon: const Icon(Icons.add_circle),
              heroTag: null,
              onPressed: () => _navigateAdd(),
            ),
    );
  }

  Widget _listTile (index,sales) {
    return Card(
        margin: EdgeInsets.only(left: 10,right: 10,top: 10),
    child: ListTile(
	
          leading: Icon(Icons.bookmark_border, size: 50),
          title: Text(sales[index].prodName),
          subtitle: Text(sales[index].prodDesc),
          onTap: () => _navigateEdit(sales, index),
        ),
  );
  }

}