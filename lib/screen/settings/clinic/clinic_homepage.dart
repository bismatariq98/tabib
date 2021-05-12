import 'package:tabib/Widget/button.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/clinic_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_range_picker/time_range_picker.dart';



class ClinicHomePage extends StatefulWidget {
  @override
  _ClinicHomePageState createState() => _ClinicHomePageState();
}

class _ClinicHomePageState extends State<ClinicHomePage> {
   



  // @override
  // void initState() {
  //   super.initState();
  // }



 


  
  String  startTime;

 
    
  //   List<Map> services = [
  //     {
  //       'cat':"a",
  //       'subCat':[
  //         'a','b','c',
  //       ]
  //     },
  //        {
  //       'cat':"b",
  //       'subCat':[
  //         'a','b','c',
  //       ]
  //     },
  //        {
  //       'cat':"c",
  //       'subCat':[
  //         'a','b','c',
  //       ]
  //     }
  //   ];
   
  //  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  // String _selectedLocation; // Option 2
  ClinicController clinicController = Get.put(ClinicController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.pink,
              automaticallyImplyLeading: false,
              title: Text("Clinic Login"),
              centerTitle: true,
              actions: [
                Row(children: [
                  Text("Logout",style: normalTextWhite,),
                  IconButton(icon: Icon(Icons.logout), onPressed: () async{
                   await  clinicController.signout();
                  })
                ],)
              ],
           ),
      body: 
      GetBuilder<ClinicController>(builder: (_){
       return  
       Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(children:[
              Column(children:[
                Container(
                  height: 80,
                  width: 90,
                  decoration: BoxDecoration(
                    image:DecorationImage(image: AssetImage("asset/tabeb.png"))
                  ),

                ),
                   Container(height: 1000,width: Get.width,
           color: Color(0xFFEBEFF7),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
               padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 20.0),
               child: Container(
                 height: 900,
                 width: Get.width,
                 color: Colors.white,

                 child: Padding(
                   padding: const EdgeInsets.all(6.0),
                   child: Column(children:[
                     Text("Adding Offers",style:normalText),
                     SizedBox(height: 10,),
                           textBox(text:"Service Provider Name",   
              validator: (input) {
                        if (input.isEmpty) {
                            return 'Please Enter a Service provider Name';
                          }
                           else if (

                              input <6
                          
                              
                              )
                               {
                            return 'Name should not be greater than 6 digits ';
                          }
                        },
                        controller: _.serviceProviderNameController,
                        keyboadType: TextInputType.emailAddress,
                        ),
                      SizedBox(height: 10,),
                              textBox(text:"Service Name",   
              validator: (input) {
                           if (input.isEmpty) {
                            return 'Please Enter a Service Name';
                          }
                           else if (

                              input <6
                          
                              
                              )
                               {
                            return 'Service Name should not be greater than 6 digits ';
                          }
                        },
                        controller:_.serviceNameController,
                        keyboadType: TextInputType.text,
                        ),
                           
                          SizedBox(height: 10,),

                                               textBox(text:"Service Description",   
              validator: (input) {
                           if (input.isEmpty) {
                            return 'Please Enter a Description';
                          }
                          
                        },
                        controller:_.serviceDescriptionController,
                        keyboadType: TextInputType.text,
                        ),
                         SizedBox(height: 10,),
                              textBox(text:"Actual Price",   
              validator: (input) {
                           if (input.isEmpty) {
                            return 'Please Enter a Actual Prive';
                          }
                           else if (

                              input <6
                          
                              
                              )
                               {
                            return 'Actual Price should not be greater than 6 digits ';
                          }
                        },
                        controller:_.actualPriceController,
                        keyboadType: TextInputType.number,
                        ),
                         SizedBox(height: 10,),
                              textBox(text:"Discounted Price",   
              validator: (input) {
                           if (input.isEmpty) {
                            return 'Please Enter a Discounted Price';
                          }
                           else if (

                              input <6
                          
                              
                              )
                               {
                            return 'Discounted Price should not be greater than 6 digits ';
                          }
                        },
                        controller:_.discountPriceController,
                        keyboadType: TextInputType.number,
                        ),
              //            SizedBox(height: 10,),
              //                 textBox(text:"location",   
              // validator: (input) {
              //              if (input.isEmpty) {
              //               return 'Please Enter a Service Provider';
              //             }
              //              else if (

              //                 input <6
                          
                              
              //                 )
              //                  {
              //               return 'Service provider should not be greater than 6 digits ';
              //             }
              //           },
              //           controller:_.loginPasswordController,
              //           keyboadType: TextInputType.emailAddress,
              //           ),
           
                      
                      SizedBox(height:10),
                        ElevatedButton(
          onPressed: () async {
            TimeRange result = await showTimeRangePicker(
              context: context,
            );

             _.times =  result;
             _.update();
          
          },
           child: Text("Time Selection"),
        ),
        Text( _.times.toString() ),

                       DropdownButton(
            hint: Text('Categories'), // Not necessary for Option 1
            value: clinicController.selectedCat,
            onChanged: (newValue) {
              clinicController.selectedCat=newValue;
              clinicController.getSubCat();

              clinicController.update();
              // setState(() {
              //   _selectedLocation = newValue;
              // });
            },
            items:
            
            [ for(var data in clinicController.cat)
               DropdownMenuItem(
              child: new Text(data),
              value: data,
              )
            
 ]     , ),   
      
 SizedBox(height: 10,),


            SizedBox(height:10),
   
         DropdownButton(
            hint: Text('Sub Categories'), // Not necessary for Option 1
            value: clinicController.selectedSubCat ,

            onChanged: (newValue) {
              clinicController.selectedSubCat=newValue;
              clinicController.update();
              // setState(() {
              //   _selectedLocation = newValue;
              // });
            },
            items:
            
            [ for(var data in clinicController.subCat)
               DropdownMenuItem(
              child: new Text(data),
              value: data,
              )
            
 ]     , ),


      
                     GestureDetector(
                       onTap: () async{
                         
                         await _.addService();
                       },
                       child: button("Add Service"))
                   ]),
                 ),

               ),
               ),
             ],
           )
      
           )
              ]),
            
          ]),
        ),
      );
      })
      
    );
  }
}