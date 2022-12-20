import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [Task(name: 'buy milk')];

//listeye task/deger eklemek icin bu list baska classlarda direk kullnmamak icin private yapiyoz ama yetmez onu UnmodifiableListView icinde koyarz ve bu sekilde bu list icndeki elemnlari cagirmak veya gostermek icin kullanilack
  //cunku bazen unutyoruz ve karistiryoz ve dogru sonuc cikmaz.task ekleyip ve onu ekranda direk gormek icin notifyListeners methodu kullanamiz lazim bu sekilde notifier methodu kullanmk zorunda kalacz
  UnmodifiableListView<Task>  get tasks {
    return UnmodifiableListView(_tasks);//bu sekilde artik baska classlarda listeye herhangi bi sey ekleyebmiyoruz cunku unmodiiable demeki degismeyen sey ama onu cagirip icindeki elemanlar/degerler gosterbiliriz/cikartabilirz
  }

  //eger yeni bi task eklemek istiyorsak ve onu ekranda direk gormek istiyorsak ChangeNotifierProvider widgeti kullanmamiz yetmez.
  //yeni bi class olusturup ve bu class ChangeNotifier class'tan miras/extends almasi lazim.
  //ve bu class icinde yeni gelen bilgiler/task icin bi method olusturmamiz lazim ve listeye ekliyoz ve bu eklemeler gormek icin bu method icinde notifyListeners() methodu kullanmak zorundayiz
  //ve bu sekilde ekranda veya widget tree'de bu list degiskeni oldugu yerlerde degisklik olunca onlari gormek icin notifyListeners sayesinde onlar aninda degsiyo ve gorebilirz
  void addTaskWithNotifier(String newTask) {
    _tasks.add(
      Task(name: newTask),
    );
    notifyListeners();

  }

//we use the get to keyword to define this being a getter and the getter is going to be something that returns a value.
  int get taskLength{//farkli yerlerde ayni kodu kullanmamk icin burda bi kere yazip ve methodu adi kullanark yeterli.Ve get kullanimi da gorduk sayilir
    return _tasks.length;
  }

  //bu methoda gelen parametre Task olark geliyo indwx/sayi degil cunku biz listedeki elemani yani checkBox'i cikarip buraya atioz
  //ve check degiskeni kullanark gelen yada sectigmiz CheckBox toggleDone methodu ile CheckBox'in degeri yada secilip secilmedigini gosterebilirz
  //ve ekranda gormek icin ve bu deger kullanilan widgetlar degismeleri gormek icin notifierListeners methodu kullanmk zoeundayiz
  void toggleDoneNotifier(Task  check) {//And in this method we're going to pass over the task that needs the updating.
    check.toggleDone();//check deguskeni Task tipinden oldugu icin toggleDone methodu cagirip checkBox degeri degistirebilirz CheckBox'i basinca
    notifyListeners();
  }

//buraya gelen input index olark gelir ve ona gore hangi CheckBox'i sectigmizi bilip ve sileneck.
  void deleteTask(int i) {
_tasks.removeAt(i);//removeAt methodu index/sayi olark bi deger aliyo ve notifierListeners methodu sayesinde Provider kullanilan widgetlar ekrada degismeleri gorecz
notifyListeners();
  }


  //*************2.cozum task Delete icin*************************************

  //***2.cozum TaskTile simifinda ListTile widget icnde onLongPress ozelligi var constructor olusturup ve callBack islemi yapip secilen CheckBox TasksList sinifina atariz
  //ve removeTask methodu kullanariz.buraya gelen input Task sinifinda yani CheckBox olark gelir cunku CheckBox/task ustunde tiklayinca List icndeki elemani index'e gore yani siralamaya gore cikarip buraya atariz
 /* void removeTask(Task checkBox) {
    _tasks.remove(checkBox);//remove methodu object tipinde bi deger aliyo index/sayi degil.
    //Removes the first occurrence of value from this list.And Returns true if value was in the list, false otherwise. The list must be growable.
    notifyListeners();
  }*/



}

