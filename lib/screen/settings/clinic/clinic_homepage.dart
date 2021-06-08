import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabib/Widget/button.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/clinic_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;


class ClinicHomePage extends StatefulWidget {
  @override
  _ClinicHomePageState createState() => _ClinicHomePageState();
}

class _ClinicHomePageState extends State<ClinicHomePage> {
   
 
  //   @override
  // void initState() {
  //   super.initState();
  //   imgRef = FirebaseFirestore.instance.collection('AddService');
  // }

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
                   Container(
                       height: 1500,width: Get.width,
           color: Color(0xFFEBEFF7),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
               padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 20.0),
               child: Container(
                 height: 1200,
                 width: Get.width,
                 color: Colors.white,

                 child: Padding(
                     padding: const EdgeInsets.all(6.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children:[
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
           
           
                        
                        SizedBox(height:10),

           textBox(text:"Clinic Location",   
              validator: (input) {
                             if (input.isEmpty) {
                              return 'Please Enter a Location';
                            }
                             else if (

                                input <1
                                )
                                 {
                              return 'Nul';
                            }
                          },
                          controller:_.clinicLocationController,
                          keyboadType: TextInputType.number,
                          ),
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
        Text( _.times.toString() ,),
            
                     


     

            SizedBox(height:10),
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

        SizedBox(height: 10,),
        Container(
          color:Colors.pink,
          child: Text("Add Pics",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:22,),)),
         SizedBox(height: 10,),
         
     Container(
      //  height: 500,
      //  width: Get.width,
       child: Stack(
            children: [
              Container(
                height: 400,
                width: Get.width,
                padding: EdgeInsets.all(4),
                child: GridView.builder(
                      itemCount: _.image.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Center(
                                child: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () =>
                   !_.uploading ? _.chooseImage() : null),
                              )
                            : Container(
                                margin: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                   image: FileImage(_.image[index - 1]),
                   fit: BoxFit.cover)),
                              );
                      }),
              ),
              _.uploading
                  ? Center(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: Text(
                              'uploading...',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircularProgressIndicator(
                            value: _.val,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          )
                        ],
                      ))
                  : Container(),
            ],
          ),
     ),
 


     
  SizedBox(height: 10,),

      
                       GestureDetector(
                         onTap: () async{
                             setState(() {
                    _.uploading = true;
                  });
                  // uploadFile().whenComplete(() => Navigator.of(context).pop());
                          //  await uploadFile();
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