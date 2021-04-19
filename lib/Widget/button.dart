import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget button(String text) {
  return Container(
    color: Colors.pink,
   height: Get.height /2 -280,
   width: Get.width,
   child: Center(child: Text(text,style:TextStyle(color:Colors.white,fontSize: 23),),),
  );
}