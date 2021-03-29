import 'package:colorpad/welcomPage/welcomepage.dart';
import 'package:colorpad/widgets/widgets%20and%20navigations.dart';
import 'package:flutter/material.dart';
import 'package:colorpad/database/database.dart';
import 'addEdit.dart';
import 'package:flutter/widgets.dart';

class NoteList extends StatefulWidget {
  @override
  NoteListState createState() {
    return new NoteListState();
  }
}


class NoteListState extends State<NoteList> {
  Future<List<Map<String, dynamic>>> taskList;
  updateTaskList() async {
    setState(() {
      taskList = NoteProvider.getNoteList();
      print("The taskLists are: $taskList");
    });
  }


  @override
  void initState() {
    super.initState();
    updateTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3A4166),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PadHeader(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff3A4166),
                borderRadius: BorderRadius.vertical(top: Radius.elliptical(50, 50))),
              child: FutureBuilder(
                future: taskList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final notes = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigation.navigateToAddTask(
                                  context,
                                  NoteMode.Editing,
                                  notes,
                                  index,
                                  updateTaskList);
                            },
                            //Every task widget
                            child: CustomCard(
                              notes: notes,
                              index: index,
                            ));
                      },
                      itemCount: notes.length,
                    );
                  }
                  return WelcomePage();
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigation.navigateToAddTask(
              context, NoteMode.Adding, null, null, updateTaskList);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


Widget screenRouting(int routeIndex){
  if(routeIndex==0){
    return NoteList();
  }else if(routeIndex == 1){

  }
}