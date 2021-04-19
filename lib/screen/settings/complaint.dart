import 'package:tabib/Widget/button.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/vehicle.dart';
import 'package:tabib/screen/Settings.dart';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Help",style: TextStyle(color: Colors.black),),
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
        Get.to(Settings());
      }),
      ),
      body: Container(height: Get.height,width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
           
      ]),
      ),
      
    );
  }
}