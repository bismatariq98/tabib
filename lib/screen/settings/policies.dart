import 'package:tabib/Widget/button.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/screen/Settings.dart';


class Policies extends StatefulWidget {
  @override
  _PoliciesState createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:
        
         Text("Policies",style: TextStyle(color: Colors.black),),
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
      Get.to(Settings());
      
            }),
      ),
        body: Container(height: Get.height,width: Get.width,
        child: Column(children: [
            Text("Privacy Policy of this App",style: headingText,),
            SizedBox(height: 20,),
             Text("Privacy Policy of this App Privacy Policy of this App Privacy Policy of this App Privacy Policy of this App Privacy Policy of this App Privacy Policy of this App Privacy Policy of this App Privacy Policy of this App",style: normalText,),

        ],),
        
        ),
        
      ),
    );
  }
}