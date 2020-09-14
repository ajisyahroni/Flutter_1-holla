import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Answer extends StatelessWidget {
  final Function selectHandler;
  String buttonTitle;
  Answer({this.selectHandler, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this.buttonTitle),
        onPressed: this.selectHandler,
      ),
    );
  }
}
