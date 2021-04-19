import 'package:tabib/Widget/button.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
  SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:8 ),
          child: TextFormField(
               decoration: InputDecoration(
               border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                 hintText: "Name",
                 prefixIcon: Icon(Icons.person),

               ),
             ),
        ),
         

               SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:8 ),
          child: TextFormField(
               decoration: InputDecoration(
               border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                 hintText: "Email",
                 prefixIcon: Icon(Icons.email_outlined),

               ),
             ),
        ),
              SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:8 ),
          child: TextFormField(
               decoration: InputDecoration(
               border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                 hintText: "Mobile Number",
                 prefixIcon: Icon(Icons.mobile_friendly),

               ),
             ),
        ),
        SizedBox(height: 10,),
        button("Save"),
          ],
        ),
      ),
      
    );
  }
}