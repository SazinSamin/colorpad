import 'package:colorpad/views/about.dart';
import 'package:colorpad/views/nodata.dart';
import 'package:colorpad/welcomPage/welcomepage.dart';
import 'package:colorpad/widgets/widgets%20and%20navigations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

  int indexForScreenRoute = 1;

  @override
  void initState() {
    super.initState();
    updateTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexForScreenRoute == 1 ? 
      RouteHomePage(taskList: taskList, updateTaskList: updateTaskList,): indexForScreenRoute == 0 ?
        Note(NoteMode.Adding, null, updateTaskList): About(),


      bottomNavigationBar: CurvedNavigationBar(

        height: MediaQuery.of(context).size.height/20,
        color: Color(0xff001AFF),
        buttonBackgroundColor: Color(0xff001AFF),
        backgroundColor: Colors.white,
        items: [
          Icon(Icons.add, color: Colors.white, size: 30,),
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.list, color: Colors.white,),
        ],
       index: indexForScreenRoute,
        onTap: (index){
          setState(() {
            indexForScreenRoute = index;
          });
        },
        animationDuration: Duration(milliseconds: 500),
        ),
    );
  }
}



class RouteHomePage extends StatefulWidget {

  Future<List<Map<String, dynamic>>> taskList;
  Function updateTaskList;

  RouteHomePage({this.taskList, this.updateTaskList});

  @override
  _RouteHomePageState createState() => _RouteHomePageState();
}

class _RouteHomePageState extends State<RouteHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.yellow, Colors.pink]
        )
      ),
      child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PadHeader(),
            Expanded(
              child: FutureBuilder(
                future: widget.taskList,
                builder: (context, snapshot) {
                  if(snapshot.data == []){
                    return NoDataHeader();
                  }
                  else if (snapshot.hasData) {
                    final notes = snapshot.data;
                    print("The note here : $notes");
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigation.navigateToAddTask(
                                  context,
                                  NoteMode.Editing,
                                  notes,
                                   snapshot.data.length - (index+1),
                                  widget.updateTaskList);
                            },
                            //Every task widget
                            child: CustomCard(
                              notes: notes,
                              index: snapshot.data.length - (index+1),
                            ));
                      },
                      itemCount: notes.length,
                    );
                  }
                  return WelcomePage();
                },
              ),
            ),
          ],
        ),
    );
  }
}

