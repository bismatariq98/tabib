import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ApprovalWaiting extends StatefulWidget {
  @override
  _ApprovalWaitingState createState() => _ApprovalWaitingState();
}

class _ApprovalWaitingState extends State<ApprovalWaiting> {
  int booList;

  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
    adminController.showData();
    return Scaffold(body: GetBuilder<AdminController>(builder: (_) {
      return Container(
        child:
            //  Text("hello"),
            ListView.builder(
                itemCount: _.approvalWaiting.length,
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
                              Text("Name:", style: normalText),
                              Text(
                                _.approvalWaiting[i].serviceProvideName,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Email:", style: normalText),
                              Text(
                                _.approvalWaiting[i].email,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("City:", style: normalText),
                              Text(
                                _.approvalWaiting[i].city,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone:", style: normalText),
                              Text(
                                _.approvalWaiting[i].phoneNumber,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Street:", style: normalText),
                              Text(
                                _.approvalWaiting[i].streetName,
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
                                _.approvalWaiting[i].approved == true ? 1 : 0,
                            labels: ['NO', 'YES'],
                            icons: [Icons.email, Icons.emoji_emotions_rounded],

                            onToggle: (index) {
                              if (index == 1) {
                                _.approvalWaiting[i].ref
                                    .update({'approved': true});
                                _.approvalWaiting[i].approved = true;
                                _.update();
                              } else {
                                _.approvalWaiting[i].ref
                                    .update({'approved': false});
                                _.approvalWaiting[i].approved = false;
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
