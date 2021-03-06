import 'package:flutter/material.dart';
import 'package:project_map/model/sales_class.dart';
import '../../constants.dart';
import '../../services/data_service.dart';


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
  void _navigateEdit(List sales,int index, bool edit) async {
    final returnData = await Navigator.pushNamed(context, sellingDetailsRoute, 
          arguments: {
            '_data': Sales.copy(sales[index]),
            'editable': edit },
            );

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
    return FutureBuilder<List<Sales>>(
        future: dataService.getSalesList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _data = snapshot.data;
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  } 

   Scaffold _buildMainScreen() {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('One UTM'),
        backgroundColor: currentTheme.appBar,
        ),
        body: Container (
          color: currentTheme.back,
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
              dataService.deleteSales(
                  id: _data[index].id); 
            setState(() {
              _data.removeAt(index);
            });
            Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Sales dismissed")));
          }
          else if (direction == DismissDirection.startToEnd ) {
            _navigateEdit(_data, index, true);
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
          onTap: () => _navigateEdit(sales, index, false),
        ),
  );
  }

Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }

}