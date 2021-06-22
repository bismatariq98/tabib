import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tabib/Widget/textBox.dart';
import 'package:tabib/const/textstyle.dart';
import 'package:tabib/controller/user_controller.dart';
import 'package:tabib/screen/Settings.dart';

class AddClinic extends StatefulWidget {
  @override
  _AddClinicState createState() => _AddClinicState();
}

class _AddClinicState extends State<AddClinic> {
  List<Map> dayTiming = [
    {
      'day': 'Monday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    },
    {
      'day': 'Tuesday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    },
    {
      'day': 'Wednesday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    },
    {
      'day': 'Thursday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    },
    {
      'day': 'Friday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    },
    {
      'day': 'Saturday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    },
    {
      'day': 'Sunday',
      'openingTime': TimeOfDay(hour: 8, minute: 00),
      'closingTime': TimeOfDay(hour: 17, minute: 00),
      'isOpened': true
    }
  ];

  String timeSelectionErrorMessage = '';
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0.0,
        leading: Container(),
        actions: [
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Get.to(Settings());
              })
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: Get.height / 2 - 250,
              width: Get.width,
              color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Enter Details To Add Clinic Info",
                  style: headingTextWhite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  textBox(
                    text: "Service Provider Name",
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a service provider name';
                      }
                    },
                    controller: userController.serviceProviderNameController,
                    keyboadType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textBox(
                    text: "City",
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Please Enter City";
                      }
                    },
                    controller: userController.cityController,
                    keyboadType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textBox(
                    text: "Street",
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Street';
                      }
                    },
                    controller: userController.streetNameController,
                    keyboadType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textBox(
                    text: "Phone Number",
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Valid Phone number';
                      }
                    },
                    controller: userController.phoneNumberController,
                    keyboadType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textBox(
                    text: "Email",
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please Enter a Email';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(input)) {
                        return 'Please Enter a Valid Email';
                      }
                    },
                    controller: userController.emailController,
                    keyboadType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Clinic Timings ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Day',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Opening Time',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Closing Time',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Opened',
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  for (var i = 0; i < dayTiming.length; i++)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                dayTiming[i]['day'],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: !dayTiming[i]['isOpened']
                                        ? Colors.grey
                                        : dayTiming[i]['closingTime'].hour <=
                                                dayTiming[i]['openingTime'].hour
                                            ? Colors.red
                                            : Colors.black),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  _selectTime(context, i, dayTiming, true);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4),
                                    child: Text(
                                      DateFormat('hh:mm a').format(DateTime(
                                          2021,
                                          08,
                                          10,
                                          dayTiming[i]['openingTime'].hour,
                                          dayTiming[i]['openingTime'].minute)),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: !dayTiming[i]['isOpened']
                                              ? Colors.grey
                                              : dayTiming[i]['closingTime']
                                                          .hour <=
                                                      dayTiming[i]
                                                              ['openingTime']
                                                          .hour
                                                  ? Colors.red
                                                  : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  _selectTime(context, i, dayTiming, false);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4),
                                    child: Text(
                                      DateFormat('hh:mm a').format(DateTime(
                                          2021,
                                          08,
                                          10,
                                          dayTiming[i]['closingTime'].hour,
                                          dayTiming[i]['closingTime'].minute)),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: !dayTiming[i]['isOpened']
                                              ? Colors.grey
                                              : dayTiming[i]['closingTime']
                                                          .hour <=
                                                      dayTiming[i]
                                                              ['openingTime']
                                                          .hour
                                                  ? Colors.red
                                                  : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Checkbox(
                                    value: dayTiming[i]['isOpened'],
                                    onChanged: (val) {
                                      setState(() {
                                        dayTiming[i]['isOpened'] = val;
                                      });
                                    }))
                          ],
                        ),
                      ),
                    ),
                  if (timeSelectionErrorMessage != '')
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$timeSelectionErrorMessage',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    )
                ],
              ),
            ),
            Container(
              height: Get.height / 2 - 300,
              width: Get.width / 2,
              color: Colors.pink,
              child: GestureDetector(
                  onTap: () async {
                    bool noError = false;
                    for (var i = 0; i < dayTiming.length; i++) {
                      if (dayTiming[i]['closingTime'].hour <=
                              dayTiming[i]['openingTime'].hour &&
                          dayTiming[i]['isOpened']) {
                        noError = true;
                      }
                    }
                    if (!noError) {
                      timeSelectionErrorMessage = '';
                      for (var i = 0; i < dayTiming.length; i++) {
                        dayTiming[i]['openingTime'] =
                            dayTiming[i]['openingTime'].hour.toString() +
                                '-' +
                                dayTiming[i]['openingTime'].minute.toString();
                        dayTiming[i]['closingTime'] =
                            dayTiming[i]['closingTime'].hour.toString() +
                                '-' +
                                dayTiming[i]['closingTime'].minute.toString();
                      }
                      await userController.addClinic(dayTiming);
                    } else {
                      setState(() {
                        timeSelectionErrorMessage =
                            'You can not select closing time before opening time';
                      });
                    }
                  },
                  child: Center(
                    child: userController.isLoading
                        ? SpinKitFoldingCube(color: Colors.pink)
                        : Text("Send For Approval", style: normalTextWhite),
                  )),
            ),
          ]),
        ),
      ),
    );
  }

  Future<Null> _selectTime(BuildContext context, int index, List timeList,
      bool isOpeningTime) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: isOpeningTime
          ? timeList[index]['openingTime']
          : timeList[index]['closingTime'],
    );
    if (picked != null)
      setState(() {
        isOpeningTime
            ? timeList[index]['openingTime'] = picked
            : timeList[index]['closingTime'] = picked;
      });
  }
}
