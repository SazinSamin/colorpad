import 'package:colorpad/widgets/widgets%20and%20navigations.dart';
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
      appBar: AppBar(
        title:
            Text(widget.noteMode == NoteMode.Adding ? 'Add note' : 'Edit note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Note title'
              
                ),
              ),
              Container(
                height: 8,
              ),
              TextField(
                controller: _textController,
                decoration: InputDecoration(hintText: 'Note text'),
              ),
              Container(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[



                  _NoteButton('Save', Colors.blue, () async {
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
                    Navigation.navigateToBack(context);
                  }),



                  Container(
                    height: 16.0,
                  ),
                  _NoteButton('Discard', Colors.grey, () {
                    Navigation.navigateToBack(context);
                  }),
                 
                ],
              ),
              SizedBox(height: 40,),
               widget.noteMode == NoteMode.Editing
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: _NoteButton('Delete', Colors.red, () async {
                            await NoteProvider.deleteNote(widget.note['id']);
                            widget.updateTaskList();
                            Navigator.pop(context);
                          }),
                        )
                      : Container()
            ],
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
