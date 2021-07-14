import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabib/Widget/SettingContainer.dart';
import 'package:tabib/Widget/bottomButton.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/controller/user_controller.dart';
import 'package:tabib/screen/HomeScreen.dart';
import 'package:tabib/screen/settings/AdminScreens/admin_home_Screen.dart';
import 'package:tabib/screen/settings/addClininc.dart';
import 'package:tabib/screen/settings/AdminScreens/adminLogin.dart';
import 'package:tabib/screen/settings/chat.dart';
import 'package:tabib/screen/settings/clinic/clinic_login.dart';
import 'package:tabib/screen/settings/complaint.dart';
import 'package:tabib/screen/settings/help.dart';
import 'package:tabib/screen/settings/policies.dart';
import 'package:tabib/screen/settings/profile.dart';
import 'package:tabib/screen/settings/notification.dart';
import 'package:tabib/screen/sub_Cat.dart';
import 'package:tabib/screen/user_signup.dart';
import 'mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tabib/controller/user_sign_in_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_login/flutter_login.dart';
import 'settings/AdminScreens/approval_waiting.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AdminController adminController =Get.put(AdminController());
  UserController userController = Get.put(UserController());

   
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
 
    bool isloading =false;
    return Scaffold(
       appBar: AppBar(
          centerTitle: true,
          title:
        
         Text("Settings",style: TextStyle(color: Colors.black),),

         actions: [
           IconButton(icon: Icon(Icons.logout,color: Colors.black,), onPressed: (){
             signOut();
            
           }),
              IconButton(icon: Icon(Icons.email,color: Colors.black,), onPressed: (){
              Get.to(()=>AdminHomeScreen());
             

            
           }),
      IconButton(icon: Icon(Icons.email,color: Colors.black,), onPressed: (){
              Get.to(()=>HomePagez());
             

            
           }),


             
         ],
      
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
      Navigator.of(context);
      
            }),
      ),
        body: 
        GetBuilder<UserController> (builder: (_){
          return     Container(
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
                             _.status1 == false ?
                             Text("Customer Mode",style: TextStyle(color: Colors.white,fontSize: 25),): Text("Admin Mode",style: TextStyle(color: Colors.white,fontSize: 25),),
                                   FlutterSwitch(
                                     activeColor: Colors.red[100],
                      value: _.status1,
                      onToggle: (val) {
                        setState(() {
                          _.status1 = val;
                          print(_.status1);
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
                    var userId = FirebaseAuth.instance.currentUser;
                    if(userId != null){
                  Get.to(AddClinic());
                    }
                  else{
                    Get.to(UserLogin());
                  }
                  },
                  child: SettingContainer(Icons.house,"Add Clinic")),
                     GestureDetector(
                  onTap: (){
                  Get.to(ClinicLogin());
                  },
                  child: SettingContainer(Icons.house,"Clinic Login")),
                       GestureDetector(
                  onTap: (){
                  Get.to(AdminLogin());
                  },
                  child: SettingContainer(Icons.house,"Admin Login")),
            ],)
          
            
            
          ),
         
      
        );
        },)
    

     
          
        
        
     
    );
  }
}
