import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/widgets/tasks_list.dart';

import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  static const id = 'TaskScreen';
  @override
  Widget build(BuildContext context) {
    var taskLength=Provider.of<TaskData>(context).taskLength;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const[
                    CircleAvatar(
                        backgroundColor: Colors.brown,
                        maxRadius: 40.0,
                        child: Icon(
                          Icons.format_list_bulleted,
                          size: 45,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'ToDo List',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.brown,
                          fontWeight: FontWeight.w900),
                    ),


                  ],
                ),
              ),
            ),Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('$taskLength Tasks',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        25.0), //horizontal demeki sagdan ve soldan bosluk verecz
                decoration: BoxDecoration(
                    color: Colors
                        .white, //decoration ozelligi kullaninca color icinde brlirlememiz lazim yoksa hata verir
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0))),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            //isScrollControlled: property to true you can make the modal take up the full screen:
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom), //bu seklide yazinca keyboard cikinca ekranda fazla alan alir cikmayinca az alan alir en uygun bu ozellik
              child: AddTaskScreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 35.0,
        ),
      ),
    );
  }
}
