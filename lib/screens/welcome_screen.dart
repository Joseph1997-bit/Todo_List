import 'package:flutter/material.dart';
import 'package:todo_list/components/rounded_button.dart';
import 'package:todo_list/screens/login_screen.dart';
import 'package:todo_list/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'WelcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(

        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'Agne',
          ),
          child: Center(
            child: AnimatedTextKit(

              pause: Duration(seconds: 2),
              animatedTexts: [
                TypewriterAnimatedText('Welcome To Our_'),
                TypewriterAnimatedText('To Do List_'),
              ],

            ),
          ),
        ),
      ),
        SizedBox(height: 25.0,),
          RoundedButton(onPressed: () {
            Navigator.pushNamed(context, LogInScreen.id);
          },
          buttonTitle: 'Log In',renk: Colors.indigo),
          RoundedButton(onPressed:(){
            Navigator.pushNamed(context, RegistrationScreen.id);

          },buttonTitle: 'Register',renk: Colors.cyan, ),
        ],
      ),
    );
  }
}
