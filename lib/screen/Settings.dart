import 'package:tabib/Widget/SettingContainer.dart';
import 'package:tabib/screen/settings/chat.dart';
import 'package:tabib/screen/settings/complaint.dart';
import 'package:tabib/screen/settings/help.dart';
import 'package:tabib/screen/settings/profile.dart';
import 'package:tabib/screen/settings/notification.dart';

import 'mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
        body: Container(
          height: Get.height,
          width: Get.width,

          child: SingleChildScrollView(
            child: Column(
              children: [
               

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Container(
                   height: Get.height/2 -300,width: Get.width,
                     decoration: BoxDecoration(
                       color: Colors.pink,
                        borderRadius: BorderRadius.circular(30),
                        
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
                SettingContainer(Icons.email,"Email"),
                 Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.add,"Add"),
                 Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.house,"House"),
            ],),
          ),
        ),
    );
  }
}
