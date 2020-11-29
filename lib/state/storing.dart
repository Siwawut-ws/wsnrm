import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsnrm/utility/my_service.dart';
import 'package:wsnrm/utility/my_style.dart';

//stf
class Storing extends StatefulWidget {
  @override
  _StoringState createState() => _StoringState();
}

class _StoringState extends State<Storing> {
  String storing;
  List<String> storings;
  List<Widget> widgets = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findStoring();
  }

  Future<Null> findStoring() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      storing = preferences.getString('storing');
      storings = MyService().createAray(storing);

      int index = 0;
      for (var item in storings) {
        widgets.add(createWidget(item, index));
        index++;
      }
    });
  }

  Widget createWidget(String string, int i) {
    return Image.asset(string == '10'
        ? i == 0
            ? 'images/box.png'
            : 'images/bin.png'
        : i == 0
            ? 'images/unbox.png'
            : 'images/unbin.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.length == 0
          ? MyStyle().showProgress()
          : GridView.extent(
              maxCrossAxisExtent: 160,
              children: widgets,
            ),
    );
  }
}
