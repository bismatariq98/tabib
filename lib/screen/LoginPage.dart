import 'mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Container(
     height: Get.height,
     width: Get.width,
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
             decoration: InputDecoration(
             border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
               hintText: "Mobile Number",
               suffixIcon: Icon(Icons.mobile_friendly),

             ),
           ),
         ),

          
        ],),
        SizedBox(height: 10,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal:8 ),
        //   child: TextFormField(
        //        decoration: InputDecoration(
        //        border: new OutlineInputBorder(
        //               borderSide: new BorderSide(color: Colors.teal)),
        //          hintText: "Mobile Number",
        //          prefixIcon: Icon(Icons.mobile_friendly),

        //        ),
        //      ),
        // ),
         

        //        SizedBox(height: 10,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal:8 ),
        //   child: TextFormField(
        //        decoration: InputDecoration(
        //        border: new OutlineInputBorder(
        //               borderSide: new BorderSide(color: Colors.teal)),
        //          hintText: "Mobile Number",
        //          prefixIcon: Icon(Icons.mobile_friendly),

        //        ),
        //      ),
        // ),
        //       SizedBox(height: 10,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal:8 ),
        //   child: TextFormField(
        //        decoration: InputDecoration(
        //        border: new OutlineInputBorder(
        //               borderSide: new BorderSide(color: Colors.teal)),
        //          hintText: "Mobile Number",
        //          prefixIcon: Icon(Icons.mobile_friendly),

        //        ),
        //      ),
        // ),

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
    );
  }
}