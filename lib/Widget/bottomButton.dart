import 'package:tabib/const/textstyle.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomButton(String text){
  return     Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(text,style: normalText,),
                      ),);
}
