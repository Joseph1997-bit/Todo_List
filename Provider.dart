import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String data = 'Top Secret Data';

  @override
  Widget build(BuildContext context) {
    //im goin to put that provider as high up as it needs be given that I need the data both in my AppBar and anthor class down
    //I'm going to put it at the very top so that my data is provided to my entire material app.
    //yani provider ile gelen bilgi widget agacinda en ustte Provider widgeti koyariz ve bu sekilde onu her widget yada her agacinda her yerde kullanabilirz
    return Provider<String>(
//The create takes the current build context so it knows where it is within the widget tree, and then it has to return the data that needs to be available to all the children
      create: (context) {
        return data; //bu classta tanimladigmiz bilgiyi baska yerde/class'larda kullanmak icin onu create ozelligi kullanark return/dondurmemiz lazim
        //Now that I've got my data being provided at the very top level of the tree, then I can ask the provider to give me that data wherever I need it.
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
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
        TextField(),
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
      //agac widget'inda en usteki tanimladigmiz bilgiyi bu sekilde yani provider kullanark direk baska classta cagirip yazdirabiliriz
      Provider.of<String>(context),
      style: TextStyle(fontSize: 20.0),
    );
  }
}

class MyText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  var saglaciyi= Provider.of<String>(context);//bu uzun kod bi degisnkene atip onun yerine kullanabilirz daha okunuşlu
    return Text( saglaciyi);

  }
}

