

import 'package:flutter/material.dart';



final kTextFiledInputDec=InputDecoration(
  hintText: 'Enter a value...',
  hintStyle: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500),
  contentPadding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0) ,//icerden padding yani bosluk verince text'in boyutunu kontrol edebilirz
//TextField'in icerden boyutunu kontrol eder.Input'a basmadan once yuvarlk ve mavi olark gorunecek ekledigimiz ozelliklere gore
  enabledBorder: OutlineInputBorder(//TextField'a basmadan once renk bouyt ve sinir bu sekilde veriyoz
      borderSide: BorderSide(color: Colors.blueAccent,style: BorderStyle.solid,width: 3.0),
      borderRadius:BorderRadius.circular(30.0)
  ),
  focusedBorder: OutlineInputBorder(//herhangi bi sey yazmak icin bastiktan sonra InputFiled yuvarlak kalmasini saglar
    borderSide: BorderSide(color: Colors.green,width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),

  ),


);