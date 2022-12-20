import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todo_list/screens/tasks_screen.dart';
import '../components/rounded_button.dart';
import '../constants.dart';

class LogInScreen extends StatefulWidget {
  static const id = 'LogInScreen';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late String email;

  late String password;

  bool showSpinner=false;

  final _auth=FirebaseAuth.instance;
//artik bu sekil _auth degiskeni kullanark tum FirebaseAuth.instance methodlarina olasabilirz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text('Log In '),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

               TextField(
                  textAlign: TextAlign
                      .center, //hintText cumlesi ve yazacgimiz kelimeler ortada olsun
                  cursorColor: Colors.black, //yazarken isaret koyan cizginin rengi
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0), //TextFiled icinde yazarken yazi rengi
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email=value;
                  },
                  decoration:
                      kTextFiledInputDec.copyWith(hintText: 'Enter your email')),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  textAlign: TextAlign
                      .center, //hintText cumlesi ve yazacgimiz kelimeler ortada olsun
                  cursorColor: Colors.black, //yazarken isaret koyan cizginin rengi
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0), //TextFiled icinde yazarken yazi rengi
                  obscureText: true,
                  onChanged: (value) {
                    password=value;
                  },
                  decoration:
                      kTextFiledInputDec.copyWith(hintText: 'Enter your password')),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                onPressed: () async {
                  setState(() {
                    showSpinner=true;
                  });
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, TaskScreen.id);
                    setState(() {
                      showSpinner=false;
                    });
                  }
                  catch(e) {
                    print(e);
                    setState(() {
                      showSpinner=false;
                    });
                  }

                },
                buttonTitle: 'Log In',renk: Colors.cyan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
