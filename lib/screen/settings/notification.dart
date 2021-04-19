import 'package:tabib/Widget/button.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0.0,
       
      ),
      body:Container(height: Get.height,width: Get.width,child: Column(children:[
        Expanded(
          
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context,i){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Card(
                elevation: 2,
                shadowColor: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                   Container(
                     height: Get.height/2 -200,width: Get.width,
                     decoration: BoxDecoration(
                       image:DecorationImage(image: AssetImage("asset/noti.png"),fit: BoxFit.cover
                       ),
                     ),
                   ),
                   Text("Heading will b great ",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                    Text("Hng will b great Heading will b great Hng will b great Heading will b great Hng will b great Heading will b great ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    button("Insert")
                ]),
              ),
            );
          }))
      ]),)
      
    );
  }
}