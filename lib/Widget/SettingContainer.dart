import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget SettingContainer(IconData icon,String text) {

  return Container(
    height: 70,
    width:Get.width,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Row(children: [
      Icon(icon),
      SizedBox(width: 15,),
      Text(text,style: TextStyle(fontSize: 20),),
      
    ],),
  );
}