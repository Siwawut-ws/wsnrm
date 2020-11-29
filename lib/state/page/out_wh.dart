import 'package:flutter/material.dart';
import 'package:wsnrm/utility/my_style.dart';

class OutWH extends StatefulWidget {
  @override
  _OutWHState createState() => _OutWHState();
}

class _OutWHState extends State<OutWH> {
  List<String> resultSearchs = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDataFromServer();
  }

  Future<Null> readDataFromServer() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTextFieldSearch(),
          buildResultSearch(),
        ],
      ),
    );
  }

  Widget buildResultSearch() => Text('Plese Type Search Customer');

  Widget buildTextFieldSearch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.all(16),
            width: 250,
            height: 50,
            decoration: MyStyle().boxDecorationTextField2(),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Search Customer',
              prefixIcon: Icon(
                Icons.search,
              ),
              border: InputBorder.none,
            ))),
      ],
    );
  }
}
