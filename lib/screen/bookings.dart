import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/vehicle.dart';
import 'package:intl/intl.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  DateTime selectedDate = DateTime.now();

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
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd MMM, yyyy').format(selectedDate)),
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
                for (var i = 0; i < 8; i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${i + 1} AM'),
                            i % 2 == 0
                                ? TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Booked',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Book Now'),
                                  )
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ))
        ],
      ),
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
