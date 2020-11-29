import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wsnrm/models/user_model.dart';
import 'package:wsnrm/state/main_menu.dart';
import 'package:wsnrm/utility/my_constant.dart';
import 'package:wsnrm/utility/my_style.dart';
import 'package:wsnrm/utility/normal_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statusRedEye = true;
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 70, left: 16, right: 16),
        decoration: BoxDecoration(color: MyStyle().darkBackgroud),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTitle(),
              buildUser(),
              buildPassword(),
              buildRaisedButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRaisedButton() => Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(top: 16),
      child: RaisedButton(
        color: MyStyle().buttorColor1,
        shape: MyStyle().roundType1(),
        onPressed: () {
          print('user = $user, password = $password');

          if (user == null || user.isEmpty) {
            normalDialog(context, 'Please Fill Every Blank');
          } else {
            checkAuthen();
          }
        },
        child: Text(
          'LOG IN',
          style: MyStyle().titelH2(),
        ),
      ));

  Future<Null> checkAuthen() async {
    String path =
        '${MyConstant().domain}/ohday/getUserWhereUser.php?isAdd=true&user=$user';

    await Dio().get(path).then((value) {
      print('value = $value');
      if (value.toString() == 'null') {
        normalDialog(context, 'No $user in my Database');
      } else {
        var result = json.decode(value.data);
        for (var json in result) {
          UserModel model = UserModel.fromMap(json);
          if (password == model.password) {
            savePrefer(model);
          } else {
            normalDialog(context, 'Please Try Again Password False');
          }
        }
      }
    });
  }

  Future<Null> savePrefer(UserModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', model.name);
    preferences.setString('type', model.type);
    preferences.setString('storing', model.storing);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainMenu(
            name: model.name,
            type: model.type,
            storing: model.storing,
          ),
        ),
        (route) => false);
  }

  Widget buildUser() => Container(
        margin: EdgeInsets.only(top: 16),
        decoration: MyStyle().boxDecorationTextField(),
        height: 50,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_box),
              contentPadding: EdgeInsets.only(left: 16, top: 14),
              hintText: 'Username',
              border: InputBorder.none),
        ),
      );

  Widget buildPassword() => Container(
        margin: EdgeInsets.only(top: 16),
        decoration: MyStyle().boxDecorationTextField(),
        height: 50,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: statusRedEye,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: statusRedEye
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  }),
              prefixIcon: Icon(Icons.lock),
              contentPadding: EdgeInsets.only(left: 16, top: 14),
              hintText: 'Password',
              border: InputBorder.none),
        ),
      );

  Widget buildTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text('Log in', style: MyStyle().titelH1()),
        ],
      ),
    );
  }
}
