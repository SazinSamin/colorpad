import 'package:colorpad/views/homepage.dart';
import 'package:flutter/material.dart';

void main()=>runApp(
  MaterialApp(debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Colors.white),
  color: Colors.red,
  home: NoteList(),
));


