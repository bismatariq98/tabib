import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/userModel.dart';

class Pictures extends StatefulWidget {
  @override
  _PicturesState createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: Get.height,
          width: Get.width,
          child:
          GridView.builder(
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 1.5,
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 7.0,
                                              crossAxisSpacing: 7.0
                                              ), 
                                               itemCount:categories.length ,
                                              itemBuilder:(context,i){
                                                return 
                                               
                                                Container(
                                                  width: 60,
                                                  height: 140,
                                                  decoration: BoxDecoration(
                                                   image: DecorationImage(image: AssetImage(categories[i].image),fit: BoxFit.cover)
                                                   
                                                  ),
                                                 
                                                );
                                                
                                             
                                              }),
      ),
      
    );
  }
}