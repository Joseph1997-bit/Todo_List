import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';

class TasksTile extends StatelessWidget {
  bool isChecked = false;
String taskTitle;
final void Function(bool?)? checkboxCallBackProperty;//checkBox icinde onChange ozelligi bool deger verio oYuden bool tipi yazdik ve buttoni basmayabilirz yani null olabilir oYuzzden null ? isarei kullandik
  //bu sefer constructor kullanarak bilgi/input ters olarak gonderecz yani onChange calinca/tiklayinca degeri alip baska sayfada olan method'a akariyoz.Buna callbacks denir
  //yani sanki checkboxCallback(bool value) methodu burda yazdik onChange ozelliginde ve kullanicidan bi deger bekliyo buttoni basinca bu deger gelir ve bu fonks statefullWidget'a gider ve orda calisir ve icindeki deisken istedigmiz yerde kullanabilirz

TasksTile({required this.taskTitle,required this.isChecked,required this.checkboxCallBackProperty,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 25.0,
            decoration: isChecked
                ? TextDecoration.lineThrough
                : TextDecoration.none), //eger CheckBox secili ise yani deger true taska/text uzerinde cizgi olsun degilse bos kalsin
      ),
      trailing: Checkbox(

        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallBackProperty,
        value:isChecked ,
      ),
    );
  }
}




//******** asagida callbaks nasil calistigini gostermek icin kullanilan method ve class **************
/*
//normally when we use callbacks,we're actually using them anonymously.yani adi ve retur typ kullanmadan direk fonksyun adisiz olarak atilacagi yere koyariz
////checkBox'tan gelen input/deger/value checkboxCallback methoduna atiliyor yani bu method sanki onChange ozeliginde bekliyo value gelince alip buraya getirip ve calistirir
//ve bu method icndeki setState sayesinde bu deger ekranda nerde varsa onu degistirip bize gosterir
void checkboxCallback(bool? checkBoxState) {
  //checkBox'tan deger gelip gelmeyebilir oYuzden nullSayfty ile yazdik yazmazsak hata verir
  setState(() {
    isChecked = checkBoxState!; //ve boylece statless sayfasinda olusan harekt bu degiskene atip ve onu istedigmiz yerde kullamabiliriz ve ne kadar az satefulWidget kullansak o kadar iyi flutter/app icin
  });
}


class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?)?
      toggleCheckboxState; //dynamic yapsak calisir ama boyle daha iyi bi sikinti cikarsa dart bize yardim eder
  TaskCheckBox(
      {required this.checkBoxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      //bu sefer constructor kullanarak bilgi/input ters olarak gonderecz yani onChange calinca/tiklayinca degeri alip baska sayfada olan method'a akariyoz.Buna callbacks denir
      //yani sanki checkboxCallback(bool value) methodu burda yazdik onChange ozelliginde ve kullanicidan bi deger bekliyo buttoni basinca bu deger gelir ve bu fonks statefullWidget'a gider ve orda calisir ve icindeki deisken istedigmiz yerde kullanabilirz
      onChanged: toggleCheckboxState,
      value: checkBoxState,
    );
  }
}
*/
