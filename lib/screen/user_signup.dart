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


class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool isLogged =  false;
  // ClinicController clinicController =Get.put(ClinicController());
  ClinicController clinicController = Get.put(ClinicController());
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:
        
        isLogged? Text("User Sign Up",style: TextStyle(color: Colors.black),):
         Text("User Login",style: TextStyle(color: Colors.black),)
        ,
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
      Get.to(MainScreen());
      
            }),
      ),
      body:
      GetBuilder<UserController>(builder: (_){
       return  
       Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(children:[
            isLogged ?
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
                   height: 330,
                   width: Get.width,
                   color: Colors.white,

                   child: Padding(
                     padding: const EdgeInsets.all(14.0),
                     child: Column(children:[
                       Text("User Login",style:normalText),
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
                          controller: _.signUpemailController,
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
                          controller:_.signUppasswordController,
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
                           
                           await _.signUp();
                         },
                         child: button("SignUp")),
                         SizedBox(height: 10,),

                                 Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Didnt Signed up ?",style: normalText,),
                             GestureDetector(
                               onTap: (){
                                 setState(() {
                                   isLogged =false;
                                 });
                               },
                               child: Text("Click here",style:TextStyle(fontSize: 20,color: Colors.blue),)),
                           ],
                         ),
                     ]),
                   ),

                 ),
               ),
             ],
           )
      
           )
                ]),
              )
              :
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
                   height: 320,
                   width: Get.width,
                   color: Colors.white,

                   child: Padding(
                     padding: const EdgeInsets.all(14.0),
                     child: Column(children:[
                       Text("Login",style:normalText),
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
                          controller: _.emailController,
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
                          controller:_.passwordController,
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
                         child: button("Login")),
 SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Didnt Signed up ?",style: normalText,),
                             GestureDetector(
                               onTap: (){
                                 setState(() {
                                   isLogged =true;
                                 });
                               },
                               child: Text("Click here",style:TextStyle(fontSize: 20,color: Colors.blue),)),
                           ],
                         ),
                     ]),
                   ),

                 ),
               ),
             ],
           )
      
           )
                ]),
              )
              ,
            
          ]),
        ),
      );
      })
     
      
    );
  }
}