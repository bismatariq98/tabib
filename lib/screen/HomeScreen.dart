import 'package:flutter/foundation.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/userModel.dart';
import 'package:tabib/screen/offers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
       
        body: Container(
           height: Get.height,
           width: Get.width,
           child: SingleChildScrollView(
             child: Column(
               children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 60,
                      child: IconButton(icon: Icon(Icons.location_on,size:30 ,color: Colors.pink,), onPressed: (){
                        return null;
                      }),
                    ),
                    Container(
                    width:  340,
                    height: 50,
                    color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                         
                         decoration: InputDecoration(
                              border: InputBorder.none,
                            
                           prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: (){
                           
                           }),
                            contentPadding: EdgeInsets.all(2),
                           hintText: "Search Here",
                           fillColor: Colors.grey,
                           hintStyle: TextStyle(color: Colors.black),
                           
                         ),
                        ),
                      ),
                    ),
                 
                ],),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
                     child: Container(
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("asset/girltwo.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                   ),
                   Container(
                     height: 130,
                     width: Get.width,
                     child:
                         Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                                        children: [
                                                      GestureDetector(
                                                        onTap: (){
                                                           Get.to(Offers());
                                                        },
                                                        child: Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                           borderRadius: BorderRadius.circular(40),
                                                            color:Colors.green,
                                                          ),
                                                          child:Icon(Icons.local_offer_outlined),
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Offers",style: TextStyle(fontSize: 20),)
                                                      ],),
                                                                   Column(
                                                        children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(40),
                                                          color:Colors.green,
                                                        ),
                                                        child:Icon(Icons.local_offer_outlined),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Offers",style: TextStyle(fontSize: 20),)
                                                      ],),
                                                                   Column(
                                                        children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(40),
                                                          color:Colors.green,
                                                        ),
                                                        child:Icon(Icons.local_offer_outlined),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Offers",style: TextStyle(fontSize: 20),)
                                                      ],),
                             ],
                             
                           ),
                         ),
                      // GridView.builder(
                      //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //                         childAspectRatio: 1.5,
                      //                         crossAxisCount: 3,
                      //                         mainAxisSpacing: 20.0,
                      //                         crossAxisSpacing: 4.0
                      //                         ), 
                      //                          itemCount:categories.length ,
                      //                         itemBuilder:(context,i){
                      //                           return 
                      //                           Column(
                      //                             children: [
                      //                           Container(
                      //                             width: 60,
                      //                             height: 60,
                      //                             decoration: BoxDecoration(
                      //                              borderRadius: BorderRadius.circular(40),
                      //                               color:categories[i].color,
                      //                             ),
                      //                             child:Icon(categories[i].icon),
                      //                           ),
                      //                           SizedBox(height: 5),
                      //                           Text(categories[i].text,style: TextStyle(fontSize: 20),)
                      //                           ],);
                      //                         }),
                   ),
                      Container(
                     height: 130,
                     width: Get.width,
                     child:
                         Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                                        children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(40),
                                                          color:Colors.green,
                                                        ),
                                                        child:Icon(Icons.local_offer_outlined),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Offers",style: TextStyle(fontSize: 20),)
                                                      ],),
                                                                   Column(
                                                        children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(40),
                                                          color:Colors.green,
                                                        ),
                                                        child:Icon(Icons.local_offer_outlined),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Offers",style: TextStyle(fontSize: 20),)
                                                      ],),
                                                                   Column(
                                                        children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration: BoxDecoration(
                                                         borderRadius: BorderRadius.circular(40),
                                                          color:Colors.green,
                                                        ),
                                                        child:Icon(Icons.local_offer_outlined),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Offers",style: TextStyle(fontSize: 20),)
                                                      ],),
                             ],
                             
                           ),
                         ),
                 
                   ),
                   Container(height: 70,width: Get.width,
                   decoration: BoxDecoration(
                     color: Color(0xFFF38FB1)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       IconButton(icon:Icon(Icons.message,size: 30,color: Colors.white) , onPressed:(){}),
                       Text("Nizam",style: TextStyle(color: Colors.white,fontSize: 30),)
                     ],),
                   ),
                   ),
                   Padding(
                       padding: EdgeInsets.all(18.0),
                     child: Column(children: [
                        GestureDetector(
                          onTap: (){
                            Get.to("");
                          },
                                                  child: Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                            color:Colors.red,

                            ),

                          ),
                        )
                     ],),)
             ],),
           ),
        ),
        
      ),
    );
  }
}