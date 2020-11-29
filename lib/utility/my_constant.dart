import 'package:flutter/material.dart';
import 'package:wsnrm/state/recieving.dart';
import 'package:wsnrm/state/storing.dart';
import 'package:wsnrm/state/supplying.dart';

class MyConstant {
  String domain = 'https://9ed2619cc439.ngrok.io';

  List<String> titleMenus = ['RECIEVING', 'STORING', 'SUPPLYING'];
  List<IconData> iconMenus = [
    Icons.shopping_cart,
    Icons.burst_mode,
    Icons.receipt_long
  ];

  List<Widget> currentWidgets = [Recieving(), Storing(), Supplying()];
  List<List<String>> subTitles = [[],['BOX BY BOX','BIN TO BIN'],[]];
  

  MyConstant();
}
