import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/screen/settings/AdminScreens/ApprovedClinic.dart';
import 'package:tabib/screen/settings/AdminScreens/approval_waiting.dart';
import 'package:tabib/screen/settings/AdminScreens/approved.dart';
import 'package:tabib/screen/settings/AdminScreens/approved_Services.dart';
import 'package:tabib/screen/settings/AdminScreens/serviceApproval.dart';


class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> with  SingleTickerProviderStateMixin {
    
    AdminController adminController = AdminController();

  @override
  // ignore: must_call_super
  void initState() {
    adminController.showData();
    adminController.showServiceData();
   
  }



  @override
  Widget build(BuildContext context) {
    adminController.showData();
    adminController.showServiceData();
     adminController.showApprovedService();
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pink,
              automaticallyImplyLeading: false,
              title: Text("Admin Login"),
              centerTitle: true,
              actions: [
                Row(children: [
                  Text("Logout",style: normalTextWhite,),
                  IconButton(icon: Icon(Icons.logout), onPressed: () async{
                   await  adminController.signout();
                  })
                ],)
              ],
           ),
         body: 
         DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Container(
            height: 900,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: TabBar(
                      onTap: (index) {
                        switch (index) {
                          case 0:
                           adminController.showData();
                            break;
                          case 1:
                             adminController.showclinicApproved();
                            break;
                          case 2:
                              adminController.showServiceData();
                            break;
                            case 3:
                            adminController.showApprovedService();
                            break;
                        }
                      },
                      indicatorColor: Colors.red,
                      isScrollable: true,
                      labelColor: Colors.red,
                      // backgroundColor: Colors.red,
                      // unselectedBackgroundColor: Colors.grey[300],
                      // unselectedLabelStyle: TextStyle(color: Colors.black),
                      // labelStyle: TextStyle(
                      //     color: Colors.red, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          // child: InkWell(
                          //     onTap: () {
                          //       friendController.getAlluser();
                          //     },
                          //     child: Text('tapp')),
                          // icon: Icon(Icons.directions_car),
                          text: "Clinic Approval",
                        ),
                        Tab(
                          // icon: Icon(Icons.directions_transit),
                          text: "Approved Clinic",
                        ),
                        Tab(
                          // icon: Icon(Icons.directions_transit),
                          text: "Service Approval",
                        ),
                        Tab(
                          // icon: Icon(Icons.directions_transit),
                          text: "Approved Services",
                        )
                      ]),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                     ApprovalWaiting(),
                       ApprovedClinic(),
                         ServiceApproval(),
                       ApprovedServices(),
                      // Center(
                      //   child: Icon(Icons.directions_bike),
                      // ),
                      // Center(
                      //   child: Icon(Icons.directions_bike),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        ),
         
         
     
    );
  }
}