import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome", style: TextStyle(fontSize: MediaQuery.of(context).size.width/5,color: Color(0xff001AFF),),),
          Text("Abeed", style: TextStyle(fontSize: MediaQuery.of(context).size.width/5,color: Color(0xff001AFF),),),
          //SizedBox(height: 20,),
          //CircularProgressIndicator(),
        ],
      )),
    );
  }
}
