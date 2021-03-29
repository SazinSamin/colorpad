import 'package:colorpad/views/addEdit.dart';
import 'package:flutter/material.dart';
import 'package:colorpad/colors/colors.dart';

class CustomCard extends StatelessWidget {
  var notes;
  int index;
  CustomCard({this.notes, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 7),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              gradient: LinearGradient(
                colors: ColorsLibrary.colorListsofLists[index % ColorsLibrary.colorListsofLists.length],
              )
            ),
        //color: ColorsLibrary.colorLists[index % ColorsLibrary.colorLists.length],
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: _NoteTitle(notes[index]['id'].toString(), ColorsLibrary.fontcolorLists [index % ColorsLibrary.fontcolorLists.length])),
              Center(child: _NoteTitle(notes[index]['title'], ColorsLibrary.fontcolorLists [index % ColorsLibrary.fontcolorLists.length])),
              Container(
                height: 4,
              ),
              Center(child: _NoteText(notes[index]['text'], ColorsLibrary.fontcolorLists [index % ColorsLibrary.fontcolorLists.length]))
            ],
          ),
        ),
      ),
    );
  }
}





class _NoteTitle extends StatelessWidget {
  final String _title;
  Color color;
  _NoteTitle(this._title, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: color),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;
  Color color;
  _NoteText(this._text,this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(color: color),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}



class Navigation{
  static void navigateToAddTask(context, notemode, notes, index, updateTaskList) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Note(notemode, notes == null ? null : notes[index], updateTaskList)));
  }

  static void navigateToBack(context){
    Navigator.pop(context);
  }
}



class PadHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff3A4166),
     /*decoration: BoxDecoration(

       gradient: LinearGradient(
         //colors: [Colors.lightBlueAccent,Colors.blueAccent]
       )
     ),*/
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/5.5,
        child: Center(child: Text("Color Pad", style: TextStyle(color: Colors.white, fontSize: 70),),),
      );
  }
}