import 'package:tabib/Widget/button.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/user_controller.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title:
        
         Text("Complaint",style: TextStyle(color: Colors.black),),
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
        Get.to(Settings());
      }),
      ),
      body:

       GetBuilder<UserController> (builder: (_){
         return     Container(height: Get.height,width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
           Container(height: Get.height/2 -300,width: Get.width,color: Colors.white,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
             Text("Services",style: normalText,),
             IconButton(icon: Icon(Icons.more_horiz_outlined), onPressed: (){})
           ],)
           ),
           Container(height: Get.height -150,width: Get.width,
           color: Color(0xFFEBEFF7),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 20.0),
                 child: Container(
                   height: 200,
                   width: Get.width,
                   color: Colors.white,

                   child: Column(children:[
                     Text("Write complaint here",style:normalText),
                     SizedBox(height: 10,),
                                        textBox(text:"Complaint",   
              validator: (input) {
                             if (input.isEmpty) {
                              return 'Please Enter a Complaint';
                            }
                         
                          },
                          controller: _.complaintController,
                          keyboadType: TextInputType.text,
                          ),
                      SizedBox(height: 10,),
                     button("Start")
                   ]),

                 ),
               ),
             ],
           )
      
           )
      ]),
      );
       },)
   
      
    );
  }
}