import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget comments(String name,String dateTime,String comment){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
       height: 70,
       width: Get.width,
       child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(name,style: TextStyle(fontSize: 20),),
                 Text(dateTime),

               ],
             ),
             Text(comment,style: TextStyle(fontSize: 25),),

           ],
         ),
       ),
      ),
       Divider(height: 4,color: Colors.black,)
    ],
  );
}