import 'package:colorpad/colors/colors.dart';
import 'package:colorpad/views/about.dart';
import 'package:colorpad/views/homepage.dart';
import 'package:colorpad/widgets/widgets%20and%20navigations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:colorpad/database/database.dart';

enum NoteMode { Editing, Adding }

class Note extends StatefulWidget {


  Function updateTaskList;
  final NoteMode noteMode;
  final Map<String, dynamic> note;

  Note(
    this.noteMode,
    this.note, [
    this.updateTaskList,
  ]);

  @override
  NoteState createState() {
    return new NoteState();
  }
}

class NoteState extends State<Note> {



    int imogiCount  = 0;
    imogiCunter(){
      imogiCount++;
      if(imogiCount>ColorsLibrary.imogies.length){
        imogiCount = 0;
    }
        return imogiCount;
  }




  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [Color(0xff001AFF),Color(0xff001AFF),Color(0xff001AFF), Colors.blue])
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                AddeditNewNoteTextContainer(widget.noteMode),

                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _titleController,
                  cursorColor: Colors.red,
                  decoration:InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                      hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Note title'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  cursorColor: Colors.red,
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Text",
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                       hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Note text'),
                ),


              //Imogi textForm Field
              TextFormField(
                initialValue: ColorsLibrary.imogies[imogiCunter()],
              ),



                Container(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[



                    _NoteButton('Save', Colors.green, () async {
                      final title = _titleController.text;
                      final text = _textController.text;



                      if (widget?.noteMode == NoteMode.Adding) {
                        NoteProvider.insertNote({'title': title, 'text': text});

                      } else if (widget?.noteMode == NoteMode.Editing) {
                        NoteProvider.updateNote({
                          'id': widget.note['id'],
                          'title': _titleController.text,
                          'text': _textController.text,
                        });
                      }



                      widget.updateTaskList();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteList()));
                    }),



                    /*Container(
                      height: 16.0,
                    ),
                    _NoteButton('Discard', Colors.grey, () {
                      Navigation.navigateToBack(context);
                    }),*/
                   
                  ],
                ),
                SizedBox(height: 20,),
                 widget.noteMode == NoteMode.Editing
                        ? _NoteButton('Delete', Colors.red, () async {
                          await NoteProvider.deleteNote(widget.note['id']);
                          widget.updateTaskList();
                          Navigation.navigateToBack(context);
                        })
                        : Container(),
                        Padding(padding: EdgeInsets.all(20),
                        child: FloatingActionButton(
                          child: Icon(Icons.arrow_back_sharp,),
                          backgroundColor: Colors.transparent,
                          onPressed: (){
                            widget.updateTaskList();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteList()));
                          },
                        ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}






class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: _onPressed,
        child: Text(
          _text,
          style: TextStyle(color: Colors.white),
        ),
        height: 40,
        minWidth: 100,
        color: _color,
      ),
    );
  }
}
