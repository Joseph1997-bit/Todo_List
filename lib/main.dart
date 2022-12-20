import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/task_data.dart';
import 'package:todo_list/screens/login_screen.dart';
import 'package:todo_list/screens/registration_screen.dart';
import 'package:todo_list/screens/tasks_screen.dart';
import 'package:todo_list/screens/welcome_screen.dart';

import 'models/task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//Firebase kodlar/methodlari calistirmak icin onu baslatmamiz lazim yoks calismaz
 await Firebase.initializeApp();//Future donduren bi method oldugu icin bitmesini beklememiz lazim sonra baska isleme geceriz
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //Provider widgetklari widget tree en ustte tanimlariz bu sekilde bu tree/agac icinde bulunan butun classlar/widgetlar herhangi bi degisme olursa onlar da degisebilir
    return ChangeNotifierProvider<TaskData>(
      create: (context) {
        return TaskData();
      },
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes:{ WelcomeScreen.id:(context) => WelcomeScreen(),
          TaskScreen.id:(context) => TaskScreen(),
LogInScreen.id:(context) => LogInScreen(),
          RegistrationScreen.id:(context) => RegistrationScreen(),

        },
      ),
    );
  }
}
