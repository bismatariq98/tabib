import 'package:tabib/Widget/SettingContainer.dart';
import 'package:tabib/Widget/bottomButton.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/user_controller.dart';
import 'package:tabib/screen/HomeScreen.dart';
import 'package:tabib/screen/settings/addClininc.dart';
import 'package:tabib/screen/settings/chat.dart';
import 'package:tabib/screen/settings/clinic_login.dart';
import 'package:tabib/screen/settings/complaint.dart';
import 'package:tabib/screen/settings/help.dart';
import 'package:tabib/screen/settings/policies.dart';
import 'package:tabib/screen/settings/profile.dart';
import 'package:tabib/screen/settings/notification.dart';
import 'mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tabib/controller/user_sign_in_controller.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
     UserController userController  = Get.put(UserController());
  
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(

              height: 300,
              width: Get.width,
              child: new Wrap(
                children: <Widget>[
                  
                  Center(child: Text("Contact me",style: headingText,)),
                     SizedBox(height:120),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  bottomButton("Email"),
                   bottomButton("Email"),
                   
                  ],)
                 
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          centerTitle: true,
          title:
        
         Text("Settings",style: TextStyle(color: Colors.black),),

         actions: [
           IconButton(icon: Icon(Icons.logout,color: Colors.black,), onPressed: (){
             signOut();
           })
         ],
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
      Navigator.of(context);
      
            }),
      ),
        body: 
      GetBuilder<UserController>(builder: (_){

        return Container(
          height: Get.height,
          width: Get.width,

          child:
                 SingleChildScrollView(
            child: 
          
             Column(
              children: [

            
                   Container(
                     height: Get.height/2 -300,width: Get.width,
                       decoration: BoxDecoration(
                         color: Colors.pink,
               
                          
                       ),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Customer Mode",style: TextStyle(color: Colors.white,fontSize: 25),),
                                   FlutterSwitch(
                                     activeColor: Colors.red[100],
                      value: _.status1,
                      onToggle: (val) {
                        setState(() {
                          _.status1 = val;
                        });
                      },
                    ),  
                          
                         ],),
                       ),
                   ),

               
               Container(
                 height: Get.height/2 -300,width: Get.width,
                   decoration: BoxDecoration(
                     color: Colors.pink,
                      
                      
                   ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       Row(children: [
                         Text("Wallet",style: TextStyle(color: Colors.white,fontSize: 25),),
                         Icon(Icons.wallet_giftcard,color: Colors.white,),
                       ],),
                       Row(children: [
                         Text("SR",style: TextStyle(color: Colors.white,fontSize: 25),),
                         Text("100",style: TextStyle(color: Colors.white,fontSize: 25),),
                       ],),
                     ],),
                   ),
               ),


              GestureDetector(
                onTap: (){
             Get.to(Profiles());

                },
                child: SettingContainer(Icons.person,"Person")),

               Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.location_on_rounded,"Location"),
                 Divider(height: 3,color: Colors.black,),
              GestureDetector(
                onTap: (){
                  Get.to(Chat());
                },
                child: SettingContainer(Icons.message_outlined,"Chat")),
                 Divider(height: 3,color: Colors.black,),
                GestureDetector(
                  onTap: (){
                    Get.to(Notifications());
                  },
                  child: SettingContainer(Icons.notifications,"Notification")),
                 Divider(height: 3,color: Colors.black,),
                GestureDetector(
                  onTap: (){
                    Get.to(Help());
                  },
                  child: SettingContainer(Icons.help,"Help")),
                 Divider(height: 3,color: Colors.black,),
                GestureDetector(
                  onTap: (){
                     Get.to(Complaint());
                   },
                  child: SettingContainer(Icons.contact_page,"Complaint")),
                 Divider(height: 3,color: Colors.black,),
                GestureDetector(
                  onTap: (){
                  Get.to(Policies()); 
                  },
                  child: SettingContainer(Icons.email,"Policy")),
                 Divider(height: 3,color: Colors.black,),
                 GestureDetector(
                     onTap: (){
               _showPicker(context);
                  },
                   child: SettingContainer(Icons.add,"Contact Us")),
                 Divider(height: 3,color: Colors.black,),
                GestureDetector(
                  onTap: (){
                   
                  },
                  child: SettingContainer(Icons.house,"Instagram")),
                    Divider(height: 3,color: Colors.black,),
                GestureDetector(
                  onTap: (){
                  Get.to(AddClinic());
                  },
                  child: SettingContainer(Icons.house,"Add Clinic")),
                     GestureDetector(
                  onTap: (){
                  Get.to(ClinicLogin());
                  },
                  child: SettingContainer(Icons.house,"Clinic Login")),
            ],)
          
            
            
          ),
         
      
        );

      })
          
        
        
     
    );
  }
}
