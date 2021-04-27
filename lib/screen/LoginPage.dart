import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabib/controller/user_sign_in_controller.dart';

import 'mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


// UserSignIn userSignIn = Get.put(UserSignIn());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body:

     Container(
     height: Get.height,
     width: Get.width,
     child: SingleChildScrollView(
            child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Image.asset("asset/twit.png",height: 80,width: 80,),
          Row(
          
            children: [
              SizedBox(width: 10,),
           Text("+966",style: TextStyle(fontSize: 17),),
           SizedBox(width: 20,),
           Container(
            
             width:300,
             child: TextFormField(
               controller:phoneController,
               decoration: InputDecoration(
               border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                 hintText: "Mobile Number",
                 
                 prefixIcon: Icon(Icons.mobile_friendly)

               ),
             ),
           ),
         
            
          ],),
               RaisedButton(
                          color: Colors.greenAccent[200],
                          onPressed: () async {
                            phoneSignIn();
                          },
                          child: Text("Sign in")),
          SizedBox(height: 10,),
        
               TextFormField(
                      controller: smsController,
                      decoration: const InputDecoration(labelText: 'Verification code'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: 
                      RaisedButton(
                          color: Colors.greenAccent[200],
                          onPressed: () async {
                         
                            // signInWithPhoneNumber();
                          },
                          child: Text("Sign in")),
                    ),
           Container(
             height: 60,width: Get.width,
             decoration: BoxDecoration(
               color: Color(0xFFF38FB1),

             ),
             child: Center(child: Text("Future",style: TextStyle(color: Colors.white,fontSize: 26),)),
             ),
             SizedBox(height: 20,),
                  Container(
             height: 60,width: Get.width,
             decoration: BoxDecoration(
               color: Color(0xFFB39DDB),
               
             ),
              child: Center(child: Text("Future",style: TextStyle(color: Colors.white,fontSize: 26),)),
             ),


       ],),
     ),
   )
   
   
   
    );
  }
}