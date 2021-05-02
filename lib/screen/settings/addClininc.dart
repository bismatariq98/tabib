import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tabib/Widget/button.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/loading_controller.dart';
import 'package:tabib/controller/user_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/vehicle.dart';
import 'package:tabib/screen/Settings.dart';
import 'package:tabib/screen/mainScreen.dart';


class AddClinic extends StatefulWidget {
   
  @override
  _AddClinicState createState() => _AddClinicState();
}

class _AddClinicState extends State<AddClinic> {
    
UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        leading: Container(),
          
        actions: [
          IconButton(icon: Icon(Icons.cancel), onPressed: (){
            Get.to(Settings());
          })
        ],
      ),
      body:  
      
      
      
       Container(height: Get.height,width: Get.width,
      child: SingleChildScrollView(
              child: Column(children:[
          Container(height: Get.height/2 -250,width: Get.width,color: Colors.pink,
          child:
         Padding(
           padding: const EdgeInsets.symmetric(horizontal:18.0),
           child: Text("Enter Details To Add Clinic Info",style: headingTextWhite,),
         ),

          ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:19.0),
             child: Column(
               children: [
                 SizedBox(height: 10,),
                 textBox(text:"Service Provider Name",  
                  validator: (input) {
                              if (input.isEmpty) {
                                return 'Please Enter a service provider name';
                              }
                            
                            },
                            controller: userController.serviceProviderNameController,
                            keyboadType: TextInputType.name,
                            ),
                 SizedBox(height: 10,),
                       textBox(text:"City",   validator: (input) {
                            if(input.isEmpty){
                             return "Please Enter City";
                            }
                            },
                            controller: userController.cityController,
                            keyboadType: TextInputType.text,
                            ),
                 SizedBox(height: 10,),
                        textBox(
                          text:"Street",   validator: (input) {
                              if (input.isEmpty) {
                                return 'Please Enter a Street';
                              } 
                            
                            },
                            controller: userController.streetNameController,
                            keyboadType: TextInputType.streetAddress,
                            ),
                  SizedBox(height: 10,),
                textBox(text:"Phone Number",   
                validator: (input) {
                              if (input.isEmpty) {
                                return 'Please Enter a Valid Phone number';
                              } 
                            
                            },
                            controller: userController.phoneNumberController,
                            keyboadType: TextInputType.number,
                            ),
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
                            controller: userController.emailController,
                            keyboadType: TextInputType.emailAddress,
                            ),
                  SizedBox(height: 10,),
               
                 

               ],
             ),
           ),

           Container(height: Get.height/2 -300,width: Get.width/2,color: Colors.pink,
          child: GestureDetector(
            onTap:() async{
               
              await userController.addClinic();

            },
            child: Center(child: 
            userController.isLoading ? SpinKitFoldingCube(color:Colors.pink):
            Text("Send For Approval",style: normalTextWhite ),)),
          ),
        ]),
      ),
      
      ),
     
      
     
      
    );
  }
}