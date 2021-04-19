import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/Widget/comments.dart';


class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child:SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 250,
              width: Get.width,
              child: Column(
                children: [
                  Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(child: Text("Tabeb app is best to help othersTaveTabeb app is best to help othersTave",style: TextStyle(color: Colors.green,fontSize: 25),)),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFFDD233),
                        borderRadius: BorderRadius.circular(12),
                           
                        ),
                        child:Center(child: Text("9.3",style: TextStyle(color: Colors.white,fontSize: 70),)) ,
                      ),

                      Container(
                           height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          // color: Color(0xFFFDD233),
                          border: Border.all(width: 2,color: Colors.green),
                        borderRadius: BorderRadius.circular(12),
                           
                        )
                      ),
       

                    
                    ],),
                  ),

                ],
              ),

            ),
            SizedBox(height: 10,),
                        Container(
                     height: Get.height,
                     width: Get.width,
                     child: ListView.builder(
                       itemCount: 8,
                       itemBuilder: (context,i){

   return comments("name", "0/90", "comment")
   
   ;
                       }),
                   )

          ],),
        ),
      ),
      
    );
  }
}