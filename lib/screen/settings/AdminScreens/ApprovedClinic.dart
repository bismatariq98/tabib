import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ApprovedClinic extends StatefulWidget {
  @override
  _ApprovedClinicState createState() => _ApprovedClinicState();
}

class _ApprovedClinicState extends State<ApprovedClinic> {
    int booList;

  AdminController adminController = Get.put(AdminController());
  @override
  Widget build(BuildContext context) {
   adminController.showclinicApproved();
    return Scaffold(body: GetBuilder<AdminController>(builder: (_) {
      return Container(
        child:
            //  Text("hello"),
            ListView.builder(
                itemCount: _.approvedClinic.length,
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
                                _.approvedClinic[i].serviceProvideName,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Email:", style: normalText),
                              Text(
                                _.approvedClinic[i].email,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("City:", style: normalText),
                              Text(
                                _.approvedClinic[i].city,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone:", style: normalText),
                              Text(
                                _.approvedClinic[i].phoneNumber,
                                style: normalText,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Street:", style: normalText),
                              Text(
                                _.approvedClinic[i].streetName,
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