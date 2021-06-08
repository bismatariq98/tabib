import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/vehicle.dart';


class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  
  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: new Text(content, style: new TextStyle(fontSize: 18.0),),
          leading: new Icon(vehicle.icon),
        ),
      );

    return columnContent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
         child:  Column(
           children: [
             Expanded(
               child: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
                return new 
                ExpansionTile(
                  title: new Text(vehicles[i].title, style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                  children: <Widget>[
                      new Column(
                        children: _buildExpandableContent(vehicles[i]),
                      ),
                  ],
                );
        },
      ),
             ),
        Container(
               height: 60,
               width: Get.width,
               color: Colors.pink,
               child: Center(child: Text("Submit ",style: TextStyle(color: Colors.white,fontSize: 20),),),
             ) ,
           ],
         ),
        
      ),
      
    );
  }
}