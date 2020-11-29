import 'package:flutter/material.dart';
import 'package:wsnrm/state/login.dart';

class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildImage(), buildOutlineButton()],
        ));
  }

  Container buildOutlineButton() => Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: OutlineButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              )),
          child: Text('SIGN IN'),
        ),
      );

  Container buildImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 110,
      child: Image.asset(
        'images/wall.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
