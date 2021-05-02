import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/screen/settings/AdminScreens/approval_waiting.dart';
import 'package:tabib/screen/settings/AdminScreens/approved.dart';


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
  }



  @override
  Widget build(BuildContext context) {
    adminController.showData();
    return Scaffold(
            appBar: AppBar(
           ),
         body: 
         DefaultTabController(
        length: 3,
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
                             adminController.showData();
                            break;
                          case 2:
                              adminController.showData();
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
                          text: "Suggested Friends",
                        ),
                        Tab(
                          // icon: Icon(Icons.directions_transit),
                          text: "Friends Request",
                        ),
                        Tab(
                          // icon: Icon(Icons.directions_transit),
                          text: "Friends",
                        )
                      ]),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                     ApprovalWaiting(),
                       ApprovalWaiting(),
                         ApprovalWaiting(),
                     
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