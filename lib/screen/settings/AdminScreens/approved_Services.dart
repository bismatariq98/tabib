import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';


class ApprovedServices extends StatefulWidget {
  @override
  _ApprovedServicesState createState() => _ApprovedServicesState();
}

class _ApprovedServicesState extends State<ApprovedServices> {
   int booList;

  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    adminController.showApprovedService();
       return 
    Scaffold(body: GetBuilder<AdminController>(builder: (_) {
      return Container(
        child:
            //  Text("hello"),
            ListView.builder(
                itemCount: _.serviceApproved.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: Get.height / 2 - 100,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      //  color:Colors.black,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          
                          Row(
                            children: [
                              Text("Name:-", style: normalText),
                              Text(
                                _.serviceApproved[i].serviceProvideName,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Service Name:-", style: normalText),
                              Text(
                                _.serviceApproved[i].serviceName,
                                style: normalText,
                              ),
                            ],
                          ),
                                   Row(
                            children: [
                              Text("Description:-", style: normalText),
                              Text(
                               _.serviceApproved[i].description,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Category:-", style: normalText),
                              Text(
                                _.serviceApproved[i].category,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("SubCategory:-", style: normalText),
                              Text(
                                 _.serviceApproved[i].subCategory,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Timing:-", style: normalText),
                              Text(
                                _.serviceApproved[i].timing.toString(),
                                style: normalText,
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Text("Actual Price:-", style: normalText),
                              Text(
                              _.serviceApproved[i].actualPrice.toString(),
                                style: normalText,
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Text("Discounted Price:-", style: normalText),
                              Text(
                                _.serviceApproved[i].discountedPrice.toString(),
                                style: normalText,
                              ),
                            ],
                          ),
                        
                        ]),
                  );
                }),
      );
    }));
  }
}