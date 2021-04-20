import 'package:colorpad/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {

  _githubUrl()async{
    const url = ' https://github.com/SazinSamin/cloudy';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Can't launch the $url";
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ColorPad",style: TextStyle(fontSize: 50, color: Colors.greenAccent),),
              Text("version : 0.9 (beta)"),
              SizedBox(height: 50,),
              Text("This is an Open Source Project, You can contribute by Github pull requeset . . ."),
              SizedBox(height: 40,),
              Text("Design and Developed by",style: TextStyle(fontSize: 14),),
              Text("Sazin Reshed Samin",style: TextStyle(fontSize: 30),),
              Text("@Copyright 2021"),
              SizedBox(height: 30,),
              Text("Contact"),
              SizedBox(height: 7,),
               InkWell(
                child: Text("My website: sazinsamin.github.io", style: TextStyle(color: Color(0xff001AFF), fontSize: 20),),
                onTap: (){
                  launch('https://sazinsamin.github.io/');
                },
              ),
              SizedBox(height: 10,),
              InkWell(
                child:  Text("Github/sazinsamin", style: TextStyle(color: Color(0xff001AFF), fontSize: 30),),
                onTap: (){
                  _githubUrl();
                },
              ),

              SizedBox(height: 10,),
              Text("Only for Testing purpose of 'Pagla' Abeed"),
              SizedBox(height: 10,),
              FloatingActionButton(
                backgroundColor: Color(0xff001AFF),
                child: Icon(Icons.arrow_back_ios_outlined, size: 30, color: Colors.white,),
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteList()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}