import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/screens/tasks_screen.dart';
import 'package:todo_list/widgets/tasks_list.dart';

class AddTaskScreen extends StatelessWidget {
  late String addNewTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Add Task',
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
          ),
          //SizedBox(height: 15.0,),
          TextField(
            autofocus: true, //Add buttoni basinca textField icin keyboard otomatik ekranda cikack
            textAlign: TextAlign.center,
            cursorColor: Colors.black,
            style: TextStyle(fontSize: 25.0),
            onChanged: (value) {
              addNewTask = value;//textField icinde yazdigmiz seyler addTask degiskene atiyoz sonra List'ye ekliyoz
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 3.0,
                        style: BorderStyle.solid))),
          ),
          SizedBox(
            height: 15.0,
          ),
          ElevatedButton(
            onPressed: () {
              //Provider kullanark ve TaskData tipi belirleyerk addTaskNotifier methodu cagirp calistirabilirz ve ekranda degsimeleri gorebilirz setState ve statfulwidget kullanmadan
              Provider.of<TaskData>(context,listen: false).addTaskWithNotifier(addNewTask);//bu calss ve icindeki buttoni widget tree disinda oldugu icin listen degeri false yapmamiz lazim yoksa hata verir
              //bu methodu kullanmazsak ekranda herhangi bi degisme goremeyiz list.add ile yapsak bile yinede ekranda direk gozukmez setState gibi calisan bi method olmasi lazi,
              Navigator.pop(context);

              //buttoni basinca liste task ekliyoz ve Task sinifindan olustugu icin bu sekilde ekliyoz ve name String bi deger aliyo
              //    list.add(Task(name: addTask));//statelessWidget oldugu icin Navigator.pop yazarsak calisir ama ekranda gozukmez setState olmasi lazim yada changNotifier method ile calisir oYuzden Navigator.push kullanabilirz.

            },
            style: ButtonStyle(elevation: MaterialStateProperty.all(10.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
              child: Text(
                'Add',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
