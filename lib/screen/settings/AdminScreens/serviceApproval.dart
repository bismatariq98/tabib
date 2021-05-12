import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';


class ServiceApproval extends StatefulWidget {
  @override
  _ServiceApprovalState createState() => _ServiceApprovalState();
}

class _ServiceApprovalState extends State<ServiceApproval> {
   int booList;

  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
      adminController.showData();
    adminController.showServiceData();
    return 
    Scaffold(body: GetBuilder<AdminController>(builder: (_) {
      return Container(
        child:
            //  Text("hello"),
            ListView.builder(
                itemCount: _.servicesApprovalWaiting.length,
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
                                _.servicesApprovalWaiting[i].serviceProvideName,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Service Name:-", style: normalText),
                              Text(
                                _.servicesApprovalWaiting[i].serviceName,
                                style: normalText,
                              ),
                            ],
                          ),
                                   Row(
                            children: [
                              Text("Description:-", style: normalText),
                              Text(
                                _.servicesApprovalWaiting[i].description,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Category:-", style: normalText),
                              Text(
                                _.servicesApprovalWaiting[i].category,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("SubCategory:-", style: normalText),
                              Text(
                                 _.servicesApprovalWaiting[i].subCategory,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Timing:-", style: normalText),
                              Text(
                                _.servicesApprovalWaiting[i].timing.toString(),
                                style: normalText,
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Text("Actual Price:-", style: normalText),
                              Text(
                                _.servicesApprovalWaiting[i].actualPrice.toString(),
                                style: normalText,
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Text("Discounted Price:-", style: normalText),
                              Text(
                                _.servicesApprovalWaiting[i].discountedPrice.toString(),
                                style: normalText,
                              ),
                            ],
                          ),
                          ToggleSwitch(
                            minWidth: 90.0,
                            cornerRadius: 20.0,
                            activeBgColor: Colors.cyan,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex:
                              _.servicesApprovalWaiting[i].approved == true ? 1 : 0,
                            labels: ['NO', 'YES'],
                            icons: [Icons.email, Icons.emoji_emotions_rounded],

                            onToggle: (index) {
                              if (index == 1) {
                                  _.servicesApprovalWaiting[i].ref
                                    .update({'approved': true});
                                 _.servicesApprovalWaiting[i].approved  = true;
                                _.update();
                              } else {
                                _.servicesApprovalWaiting[i].ref
                                    .update({'approved': false});
                                 _.servicesApprovalWaiting[i].approved = false;
                                _.update();
                              }
                             
                            },
                          ),
                        ]),
                  );
                }),
      );
    }));
  }
}