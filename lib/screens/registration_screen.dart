import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/components/rounded_button.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/screens/tasks_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegistrationScreen extends StatefulWidget {
  static const id = 'RegistrationScreen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner=false;
late String email;
late String password;
final _auth=FirebaseAuth.instance;//kayit icin FirebaseAuth'tan bi degisken olusturyoz bi o degiskeni degistirmeycz.instance/misal/ornek/نموذج
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text('Registration '),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,//zorunlu ve en onemli ozellik spinner/bekleme dairesi gostemek icin ve degeri true olmasi lazim
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  textAlign: TextAlign
                      .center, //hintText cumlesi ve yazacgimiz kelimeler ortada olsun
                  cursorColor:
                  Colors.black, //yazarken isaret koyan cizginin rengi
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0), //TextFiled icinde yazarken yazi rengi
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
email=value;
                  },
                  decoration: kTextFiledInputDec.copyWith(hintText: 'Enter your email')
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  textAlign: TextAlign
                      .center, //hintText cumlesi ve yazacgimiz kelimeler ortada olsun
                  cursorColor:
                  Colors.black, //yazarken isaret koyan cizginin rengi
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0), //TextFiled icinde yazarken yazi rengi
                  obscureText: true,
                  onChanged: (value) {
password=value;
                  },
                  decoration: kTextFiledInputDec.copyWith(hintText: 'Enter your password')
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(onPressed: () async {//because this is an asynchronous method, we don't want to continue on without knowing whether if our new user has been created or not

                setState(() {
                  showSpinner=true;
                });
                try{await _auth.createUserWithEmailAndPassword(email: email, password: password);
Navigator.pushNamed(context, TaskScreen.id);
setState(() {
  showSpinner=false;//register islemi tamamladiktan sonra artik animation daire donmesine gerek yok false yapip onu durduryoz
});
}

catch(e) {//kayit yaparken eger ayni gmail iki kere yazarsak veya eksik yazsak veya password 6 karakterdan kucuk olursa Console'da hatayi gosterck bize
  print(e);
  setState(() {
    showSpinner=false;////Rigister islemi hatali olursa  artik animation daire donmesine gerek yok false yapip onu durduryoz
  });
}

              },buttonTitle: 'Register',renk: Colors.cyan),

            ],
          ),
        ),
      ),
    );
  }}
