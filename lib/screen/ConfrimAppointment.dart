import 'dart:io';
import 'package:get/get.dart';
import 'mainScreen.dart';
import 'package:flutter/material.dart';

class ConfrimAppointment extends StatefulWidget {
  @override
  _ConfrimAppointmentState createState() => _ConfrimAppointmentState();
}

class _ConfrimAppointmentState extends State<ConfrimAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: Get.height,
          width: Get.width,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(
                "asset/appoint.png"
              )
              )
              ),

            ),
            Container(
              color: Colors.pink,
              width:250,height: 30,child: Center(child: Text("Back to HomePage",style: TextStyle(fontSize: 25,color: Colors.white),),),)
          ],),

      ),
      
    );
  }
}