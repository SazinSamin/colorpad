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
      padding: EdgeInsets.fromLTRB(20, 7.5, 20, 20),
          child: Container(
            decoration: BoxDecoration(
                           color: ColorsLibrary.colorListsofLists[index % ColorsLibrary.colorListsofLists.length],
              boxShadow: [
                BoxShadow(
                    color: ColorsLibrary.ListsOfShadowColor[index % ColorsLibrary.ListsOfShadowColor.length],
                    offset: Offset(0.0, 10.0), //(x,y)
                    blurRadius: 5.0,
                  ),
              ],
             
              borderRadius: BorderRadius.circular(20),
             /* gradient: LinearGradient(
                
              )*/
            ),
        //color: ColorsLibrary.colorLists[index % ColorsLibrary.colorLists.length],
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Center(child: _NoteTitle(notes[index]['id'].toString(), ColorsLibrary.fontcolorLists [index % ColorsLibrary.fontcolorLists.length])),
              Center(child: _NoteTitle(notes[index]['title'], ColorsLibrary.fontcolorLists [index % ColorsLibrary.fontcolorLists.length])),
              Container(
                height: 4,
              ),
              notes[index]['text'] == "" ? Container() : Center(child: _NoteText(notes[index]['text'], ColorsLibrary.fontcolorLists [index % ColorsLibrary.fontcolorLists.length])),
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
    return Stack(
      children: [
        Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(40)),
       color: Color(0xff001AFF),
       boxShadow: [
         BoxShadow(
           color: Colors.blue,
                    offset: Offset(1.0, 10.0), //(x,y)
                    blurRadius: 19.0,
         )
       ]
     ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/3.5,
        child: Center(child: Text("Color Pad", style: TextStyle(color: Colors.white, fontSize:MediaQuery.of(context).size.height/11),),),
      )
      ],
    );
  }
}




class AddeditNewNoteTextContainer extends StatelessWidget {

  NoteMode noteMode;

  AddeditNewNoteTextContainer(this.noteMode);

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 40),
                child: noteMode == NoteMode.Adding ? 
                Center(child: Text("Add new task", style: TextStyle(fontSize: 40, color: Colors.white),)) : 
                Center(child: Text("Edit task", style: TextStyle(fontSize: 40, color: Colors.white))),
              );
  }
}