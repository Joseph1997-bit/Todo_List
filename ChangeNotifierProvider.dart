import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //im goin to put that ChangeNotifierProvider as high up as it needs be given that I need the data both in my AppBar and anthor class down
    //yani provider ile gelen bilgi widget agacinda en ustte Provider widgeti koyariz ve bu sekilde onu her widget yada her agacinda her yerde kullanabilirz
  //ChangeNotifierProvider ile tanimladigmiz bilgiler ekranda herhangi bi degisme olursa onu kullanark kullandigimiz yerlerde ekranda degismeleri gorecz setState gibi
   //ve normal bi bilgi almayacz class tipi changeNotifier'dan miras almis bi sinif oYuzden bu Widgeti kullandik
    return ChangeNotifierProvider<Bilgi>(
//The create takes the current build context so it knows where it is within the widget tree, and then it has to return the data that needs to be available to all the children
      create: (context) {
        return Bilgi();
        //create icinde tanimladigmiz bilgiyi baska yerde/class'larda kullanmak icin onu create ozelligi kullanark return/dondurmemiz lazim
        //Now that I've got my data being provided at the very top level of the tree, then I can ask the provider to give me that data wherever I need it.
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),//title ozelligi widegt tipi bi input aliyo ve MyText classi widget'ten miras aldigi icin onu atabilirz
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Level2());
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        SizedBox(
          height: 15.0,
        ),
        Container(child: Level3()),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      //the 'of' method expects us to specify what kind of data we're trying to get hold of.
      //agac widget'inda en usteki create icinde return etigmiz Classi bu sekilde yani provider kullanark ve tipi belirleyerek of<tip> direk baska classta cagirip yazdirabiliriz
      Provider.of<Bilgi>(context,listen: true).data,//Bilgi class icindeki data String tipinden olusan degisken bu sekilde Text icinde cagirip calistirabilirz
      style: TextStyle(fontSize: 20.0),
    );
  }
}

class MyText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text(  Provider.of<Bilgi>(context,listen: false).data);
    //Let's say that we want it to get the original value of the data that's stored but we don't want it to listen for updates.
    //We don't want it to rebuild every time this data changes.So we add the listen property and we can set it to false.
  //by default this property is set to true
  }
}

class MyTextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue){
        print(newValue);
        //TextField'dan yeni gelen bilgiyi provider kullanark bu methoda atiyoz ve bu method icinde notifierListener methodu sayesinde
        //bu data degiskeni degeri deisecek ve onu ekranda degismeleri gorecz setState gibi calisir yani ama statfullwidget kullanmadan
//bu method widget tree disinda oldugu icin degismelere listen/dinleme ozelligi kullanamayiz oYuzden false yapmamiz lazim
        //cunku Provider widgti sadece tree widget icinde olanlara olasip degeri deistirebilir ve biz agacin en ustte tanimladik MaterailApp'ta

        Provider.of<Bilgi>(context,listen: false).changeBilgi(newValue);

      },
    );
  }
}


//this ChangeNotifier class actually comes from Flutter itself.This is not something that came with provider.
//and it exists for the purpose of notifying listeners to this particular class of any updates in the class.
class Bilgi extends ChangeNotifier{
  String data = 'Top Secret Data';
//bu class ve icindki method widget tree yani agac widget icinde degil disarda ayri bi class oYuzden listen ozelligi calismaz onu false yapmamiz lazim yoksa hata verir
void changeBilgi(String newData ) {
  //yeni gelen bilgiyi data deigskene atiyoz ve ekranda degismeleri gormek icin notifieyListenr methodu kullanmamiz lazim
//ve provider ile yazilan data degiskeni yada kullnilan yerileri listen ozelligi sayesinde degismeleri aninda olacktir ekranda setState gibi ama statfullwidget yok
  data=newData;
notifyListeners();
  //what notifyListeners method does is as soon as we update our data to the new value,
  // we call notify listeners so that everybody who's listening to our provider can rebuild their widgets as well because they're notified/bildirildi of that state change.

}
}