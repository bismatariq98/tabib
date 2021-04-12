import 'package:tabib/Widget/SettingContainer.dart';

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
        body: Container(
          height: Get.height,
          width: Get.width,

          child: SingleChildScrollView(
            child: Column(
              children: [
               SettingContainer(Icons.person,"Person"),

               Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.location_on_rounded,"Location"),
                 Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.notification_important_outlined,"Notification"),
                 Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.help,"Help"),
                 Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.warning,"Warning"),
                 Divider(height: 3,color: Colors.black,),
                SettingContainer(Icons.contact_page,"Writing"),
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
