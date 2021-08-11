import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:tabib/controller/clinic_controller.dart';
import 'package:tabib/controller/user_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/booking.dart';
import 'package:tabib/model/service_provider_model.dart';
import 'package:tabib/model/vehicle.dart';
import 'package:intl/intl.dart';
import 'package:tabib/provider/clinic_provider.dart';

class Bookings extends StatefulWidget {
  final String serviceProviderName;
  Bookings(this.serviceProviderName);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  ClinicController clinicController = Get.put(ClinicController());

  _buildExpandableContent(Vehicle vehicle) {
    List<Widget> columnContent = [];
    for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: new Text(
            content,
            style: new TextStyle(fontSize: 18.0),
          ),
          leading: new Icon(vehicle.icon),
        ),
      );

    return columnContent;
  }

  @override
  Widget build(BuildContext context) {
    clinicController.getTiming(widget.serviceProviderName);
    UserController userController = Get.put(UserController());
    var _clinicProvider = Provider.of<ClinicProvider>(context);

    return Scaffold(body: Container(
      child: GetBuilder<ClinicController>(builder: (_clinincController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd MMM, yyyy')
                          .format(_clinincController.selectedDate)),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("clinicapproval")
                        .doc(_clinicProvider.currentUserId)
                        .get(),
                    builder: (context, snapshot) {
                      Clinic clinic = Clinic.fromMap(snapshot.data.data());

                      return ListView.builder(
                        itemCount: clinic.timing.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      clinic.timing[index].openingTime,
                                    ), // this is only the UI,not coming from fireabse
                                    //you have to fecth data time slots from fireabse and show here
                                    if (!clinic.timing[index].isOpened)
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Booked',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    else
                                      ElevatedButton(
                                        onPressed: () async {
                                          setState(() {
                                            clinic.timing[index].isOpened =
                                                true;
                                          });
                                          await FirebaseFirestore.instance
                                              .collection("clinicapproval")
                                              .doc(
                                                  _clinicProvider.currentUserId)
                                              .update({
                                            "serviceProviderEmail":
                                                clinic.serviceProviderEmail,
                                            "serviceProviderName":
                                                clinic.serviceProviderName,
                                            "serviceProviderCity":
                                                clinic.serviceProviderCity,
                                            "serviceProviderPhone":
                                                clinic.serviceProviderPhone,
                                            "serviceProviderStreet":
                                                clinic.serviceProviderStreet,
                                            // "clinicDoc":doc.reference,
                                            "approved": false,
                                            "timing": clinic.timing,
                                            "documentId":
                                                snapshot.data.id.toString(),
                                            "userId":
                                                _clinicProvider.currentUserId,
                                          });
                                        },
                                        child: Text('Book Now'),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ))
          ],
        );
      }),
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: clinicController.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != clinicController.selectedDate)
      setState(() {
        clinicController.selectedDate = picked;
      });
  }

  Future getBookingDetails() async {}
}
