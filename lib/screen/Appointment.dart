import 'package:tabib/screen/ConfrimAppointment.dart';
import 'package:tabib/screen/previousAppointment.dart';

import 'mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>  with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    // friendController.getallData();


    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  TabController _tabController;
  TabBar get _tabBar => TabBar(
        controller: _tabController,
        indicatorColor: Colors.pink,
        labelColor: Colors.pink,
        unselectedLabelColor: Colors.grey,
     
        tabs: [
          Tab(
            
           text: "Previous Appointment",),
          Tab( text: "Confirmed Appointment"),
          
          // Tab(icon: Icon(Icons.ondemand_video, size: 30.0)),
         
        ],
      );
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointments"),
        backgroundColor: Colors.white10,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.message), onPressed: (){})
        ],
        bottom: 
          PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: ColoredBox(
            color: Colors.white,
            child: _tabBar,
          ),
        ),
      ),
      body:
      TabBarView(
        controller: _tabController,
        children: [
           ConfrimAppointment(),
           PreviousAppointment()
      ],)

      //  Container(
      //   height: Get.height,
      //   width: Get.width,
      //   child:Column(
      //     children: [

      //   ],) 
      // ,),
      
    );
  }
}