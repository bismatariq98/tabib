import 'package:tabib/Widget/button.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/clinic_controller.dart';
import 'package:tabib/controller/user_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/vehicle.dart';
import 'package:tabib/screen/Settings.dart';
import 'package:tabib/screen/mainScreen.dart';


class ClinicLogin extends StatefulWidget {
  @override
  _ClinicLoginState createState() => _ClinicLoginState();
}

class _ClinicLoginState extends State<ClinicLogin> {
  // ClinicController clinicController =Get.put(ClinicController());
  ClinicController clinicController = Get.put(ClinicController());
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:
        
         Text("Clinic Login",style: TextStyle(color: Colors.black),),
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
      Get.to(MainScreen());
      
            }),
      ),
      body:
      GetBuilder<ClinicController>(builder: (_){
       return  
       Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(children:[
              Container(
                height: Get.height,
                width: Get.width,
                color: Color(0xFFF0EEF1),
                child: Column(children:[
                  Container(
                    height: 80,
                    width: 90,
                    decoration: BoxDecoration(
                      image:DecorationImage(image: AssetImage("asset/tabeb.png"))
                    ),

                  ),
                     Container(height: Get.height -100,width: Get.width,
           color: Color(0xFFEBEFF7),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 20.0),
                 child: Container(
                   height: 300,
                   width: Get.width,
                   color: Colors.white,

                   child: Padding(
                     padding: const EdgeInsets.all(14.0),
                     child: Column(children:[
                       Text("Clinic Login",style:normalText),
                       SizedBox(height: 10,),
                             textBox(text:"Email",   
              validator: (input) {
                             if (input.isEmpty) {
                              return 'Please Enter a Email';
                            }
                             else if (
                               !RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(input)) {
                              return 'Please Enter a Valid Email';
                            }
                          },
                          controller: _.loginEmailController,
                          keyboadType: TextInputType.emailAddress,
                          ),
                        SizedBox(height: 10,),
                                textBox(text:"Password",   
              validator: (input) {
                             if (input.isEmpty) {
                              return 'Please Enter a Password';
                            }
                             else if (

                                input <6
                            
                                
                                )
                                 {
                              return 'Password should not be greater than 6 digits ';
                            }
                          },
                          controller:_.loginPasswordController,
                          keyboadType: TextInputType.emailAddress,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Remember Me",style: normalText,),
                                Text("Forget Password ?",style: TextStyle(fontSize: 20,color: Colors.blue),),

                          ],),
                            SizedBox(height: 10,),
                       GestureDetector(
                         onTap: () async{
                           
                           await _.signIn();
                         },
                         child: button("Login"))
                     ]),
                   ),

                 ),
               ),
             ],
           )
      
           )
                ]),
              ),
            
          ]),
        ),
      );
      })
     
      
    );
  }
}