import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcom", style: TextStyle(fontSize: 30),),
          SizedBox(height: 20,),
          CircularProgressIndicator(),
        ],
      )),
    );
  }
}
