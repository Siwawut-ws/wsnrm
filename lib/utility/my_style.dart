import 'package:flutter/material.dart';

class MyStyle {
  Color darkBackgroud = Color(0xff3C444D);
  Color buttorColor1 = Colors.red[400];

  Widget showProgress() {
    return Center(child: CircularProgressIndicator());
  }

  RoundedRectangleBorder roundType1() {
    return RoundedRectangleBorder(
        side: BorderSide(width: 2, color: Colors.red),
        borderRadius: BorderRadius.circular(30));
  }

  BoxDecoration boxDecorationTextField() {
    return BoxDecoration(color: Colors.white);
  }

  TextStyle titelH1() {
    return TextStyle(
      fontSize: 30,
      color: Colors.white,
    );
  }

  TextStyle titelH2() {
    return TextStyle(
      fontSize: 14,
      color: Colors.white,
    );
  }

  MyStyle();
}
