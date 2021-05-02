import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ApprovalWaiting extends StatefulWidget {
  @override
  _ApprovalWaitingState createState() => _ApprovalWaitingState();
}

class _ApprovalWaitingState extends State<ApprovalWaiting> {
    
 

  AdminController adminController  = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
            body:   
            GetBuilder<AdminController>(builder: (_){
              return        
               Container(
         child:
        //  Text("hello"),
          ListView.builder(
          itemCount: _.approvalWaiting.length,
          itemBuilder: (context,i){
           return Container(
             height: Get.height/2 -100,
             width: Get.width,
             decoration: BoxDecoration(
               border:Border.all(width:2),
               color:Colors.black,
               
             ),
             child: Column(children:[
               Text(_.approvalWaiting[i].email),

             ]),

           );

         }),
         
         );
            })
            
     
    );
  }
}