import 'package:flutter/material.dart';

class NoDataHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
          child: Text("No task yet", style: TextStyle(fontSize: 50),)),
        Text("Add task by tap on bottom left '+' icon", style: TextStyle(fontSize: 15),)
      ],),
    );
  }
}