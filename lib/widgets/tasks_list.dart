import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/widgets/tasks_tile.dart';
import '../models/task.dart';

//let's go ahead and make our task list into a stateful widget so that we can update it's state.
class TasksList extends StatelessWidget {

//List class disinda yazinca istedigmiz yerde kullanbilirz.uydem'de farkli bi sekilde yapmis


  //tasks degiskeni List olarak olusturduk ama turu Task sinifin'dan/class'tan yani bu list icinde sadece Task sinifi olacak ve birden fazla yazabilirz cunku List icinde
  //Task sinifinda defult deger verdigmiz icin burda deger yazmak zorunda degiliz

  @override
  Widget build(BuildContext context) {
 //  var tasksList= Provider.of<TaskData>(context).tasks;
//Provider yerine consumer widgeti kullanark islemleri daha kolaylastirabilir ve az kod yazmis olurz ve StateFull classi kullanmadan daha az resource kullanmis oluruz.
   //this consumer widget is going to be the one that's listening for changes.So when task data updates its state then it's going to rebuild this entire list view and update all the task titles that have changed.
    return Consumer<TaskData> (
      //consumer tipi TaskData belirledigmiz icin taskData onun tipinden oluyo ve o degiskeni kullanark TaskData class icineki biliglere olasabilirz
      builder:(context, taskData, child) {
        return  ListView.builder(
          //when you need to build a large number of children inside the list view because it's only going to rebuild the parts that the user can actually see, the parts on screen..So it saves resources when you have a really large list.
          //yani ekranin kapsayabilecegi kadar yada gosterebilecgi kadar bize widgetlari calistirp gostereck.it would actually only use up resources to build the ones that are visible on screen.
          // saving a lot of computation/hesaplamalar and making our app a lot faster.
          //itemBuilder zorunlu ozellik iki tane parametre aliyo 1.si this build context basically contains the information that tells the children widget where the parent is in the widget tree.yani widget agacinda wiget'in yeri bildiriyo/belirliyo
          //2.parametre the index of the current item that's being built.
          itemBuilder: (BuildContext context, int index) {//ekranda gosterilen widgetlar/tasklar indexleri 0'dan baslar sirayla bastan/yukardan aşağıya doğru artarark 0,1,2... ne kadar widget varsa o kadar index/sayi
            final task=taskData.tasks[index];//task deiskeni Task tipinden olusuyor cunku parametre olark kullaninca biz aslinda index/sayi atmiyoz listein icndeki degeri index'e gore cikarip atiyoz.mesela task[0] yani listede 1.eleman/checkbox cikarip atiyoz
            return GestureDetector(
              onLongPress: (){
               taskData.deleteTask(index);
               print(index);
              },
              child: TasksTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  //callback methodlari cogu zaman boyle kullanilir anonymus/adisiz olarak direk koayriz daha uygun
                  //ve boylece statless sayfasinda checkBox buttoni basinca deger/value buraya atiliyor ve setState sayesinde ekranda geriken degismeler olur ne kadar az satefulWidget kullansak o kadar iyi flutter/app icin
                  checkboxCallBackProperty: (_) {
                   // tasksList.tasks[index].toggleDone(); //toggleDone fonksyunu calisin isDone degiskenin degeri degistireck ve setState sayesinde ekranda degismeler gorecz
               taskData.toggleDoneNotifier(task);//listenin 1.index/degeri parametre olark atiyoz ve ordaki method calisip listenin 1.chekBox'in degeri degiseck ve notifierLister sayesinde degismeleri ekranda gorecz ve boyle sirayla gider index sayesinde
                  }),
            ); //yani 1.index calisnca toggleDoneNotifier methodu calisack ve 1. CheckBox degeri ekranda degisecek
            //listenin indexleri/elemanlari cagirmak icin builder icinde 2. parametresi index degiskeni kullancaz ekranda ne kadar widget gosterebilecekse index o kadar calisip listenin elemanlari gosterir
            //TasksTile statlessWidget sinifina constructor parametresi Task sinifindan olusan list olarak atacz.yani constructor inputlari List olarak atacz
          },
          itemCount: taskData.taskLength, //itemCount demeki we can tell it how many of these taskTiles we actually want to build.yani ne kadar task olusturacagimizi belirliyo
        );
      },
    );
  }
}
