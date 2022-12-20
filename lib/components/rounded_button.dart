import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
RoundedButton({required this.onPressed,required this.buttonTitle,required this.renk});
final String buttonTitle;
 final void  Function()? onPressed;
 final Color renk;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        padding: EdgeInsets.all(18.0),
        elevation: 5.0,minWidth: 30.0,height: 60.0,
        child: Text(buttonTitle,style: TextStyle(fontSize: 20.0),),
        color: renk,
        onPressed:onPressed ,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0)),
      ),
     );
  }
}
