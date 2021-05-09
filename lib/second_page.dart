import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String? input;

  SecondPage({this.input});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('second page : $input'),
      ),
    );
  }
}
