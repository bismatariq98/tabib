import 'package:tabib/screen/newOffer.dart';

import 'mainScreen.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> with SingleTickerProviderStateMixin {
  
  @override
  void initState() { 
    super.initState();
    _tabController =  TabController(vsync: this,length: 2);
  }


  TabController _tabController;
  TabBar get _tabs => TabBar(
    controller: _tabController,
    indicatorColor: Colors.pink,
    labelColor: Colors.pink,
     unselectedLabelColor: Colors.black,
    tabs: [
    Tab(text: "New Offers",),
    Tab(text: "New Offers",)
  ],);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("New Offer"),
        centerTitle: true,
        actions: [
          Icon(Icons.book_rounded),
        ],
        bottom: PreferredSize(child: ColoredBox
        (color: Colors.white,child: _tabs,), preferredSize:_tabs.preferredSize),
      ),
      body: 
      TabBarView
      
      (
        controller: _tabController,
        children: [
          NewOffer(),
          Text("Previous Offer") 
      ],)
      
    
       
    );
  }
}