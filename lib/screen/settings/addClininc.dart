import 'package:tabib/Widget/button.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/vehicle.dart';
import 'package:tabib/screen/Settings.dart';


class AddClinic extends StatefulWidget {
  @override
  _AddClinicState createState() => _AddClinicState();
}

class _AddClinicState extends State<AddClinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        leading: Container(),
        actions: [
          IconButton(icon: Icon(Icons.cancel), onPressed: (){
            Get.to(Settings());
          })
        ],
      ),
      body: Container(height: Get.height,width: Get.width,
      child: Column(children:[
        Container(height: Get.height/2 -250,width: Get.width,color: Colors.pink,
        child:
       Text("jalksdjlkasjdlkahsdlkhalkfalkd",style: headingTextWhite,),

        ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal:19.0),
           child: Column(
             children: [
               SizedBox(height: 10,),
               textBox("name"),
               SizedBox(height: 10,),
               textBox("name"),
               SizedBox(height: 10,),
               textBox("name"),
                SizedBox(height: 10,),
               textBox("name"),
                SizedBox(height: 10,),
               textBox("name"),
                SizedBox(height: 10,),
               textBox("name"),
               

             ],
           ),
         ),

         Container(height: Get.height/2 -245,width: Get.width,color: Colors.pink,
      
        ),
      ]),
      
      )
      
    );
  }
}