import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:tabib/model/vehicle.dart';
class OfferDetail extends StatefulWidget {
  @override
  _OfferDetailState createState() => _OfferDetailState();
}

class _OfferDetailState extends State<OfferDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20,),
            Container(
              height: 130,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
            Text("Detail",style: TextStyle(fontSize: 24),),
            Row(children: [
                       Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                       color: Color(0xFFA2ABD7)
                                    ),
                                    child: Center(child: Text("-53%",style: TextStyle(color: Colors.white),)),

                                  ),  SizedBox(width: 10,),
                                  Text("SR",style: TextStyle(fontSize: 22),),
                                  SizedBox(width: 10,),
                                  Text("1972",style: TextStyle(fontSize: 22),),
                                    SizedBox(width: 10,),

 Text("0099",style: TextStyle(decoration: TextDecoration.lineThrough,
                              ))
            ],)
                    ],),
                  ),
                  SizedBox(height: 10,),
                  Expanded(child: 
                  Text("Descriotion are the only ting that can beandled very rfssionny ina w akklasdlkasdalhd",style: TextStyle(fontSize: 19),))
                ],
              ),
            ),
             SizedBox(height: 15,),
            Container(  height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                    Column(
                      children: [
                      Text("Meharban",style: TextStyle(fontSize: 19),),
                      Text("Marahaba")
                    ],),
                    Icon(Icons.location_city,size: 30,)
                 ],),
               ),
              ),
              SizedBox(height: 15,),
           Container(  
             height: 500,
             width: Get.width,
             decoration: BoxDecoration(
               color: Colors.grey[200],
             ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Text("Meharban",style: TextStyle(fontSize: 19),),
                       Icon(Icons.linear_scale_outlined,size: 30,)
                    ],),

                    Expanded(child: Text("1:-ahsdkhaslkdhlaksdlkasjdlkasjdlkajslkdjaslkdjalskdjlaksjdlkasjdlkasjdlkjsalkdjaksjdlaksjdklasjdlkasjdlkajsdlkajsdlkasjl",style: TextStyle(fontSize: 25),),),
                                         Expanded(child: Text("1:-ahsdkhaslkdhlaksdlkasjdlkasjdlkajslkdjaslkdjalskdjlaksjdlkasjdlkasjdlkjsalkdjaksjdlaksjdklasjdlkasjdlkajsdlkajsdlkasjl"),),
                                                              Expanded(child: Text("1:-ahsdkhaslkdhlaksdlkasjdlkasjdlkajslkdjaslkdjalskdjlaksjdlkasjdlkasjdlkjsalkdjaksjdlaksjdklasjdlkasjdlkajsdlkajsdlkasjl"),),
                  ],
                ),
              ),
             ),
             SizedBox(height: 15,),
             Container(
               height: 60,
               width: Get.width,
               color: Colors.pink,
               child: Center(child: Text("Submit ",style: TextStyle(color: Colors.white,fontSize: 20),),),
             ) ,

     
          ],),
        ),
      ),
      
    );
  }
}