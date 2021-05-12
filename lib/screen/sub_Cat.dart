import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePagez extends StatefulWidget {
  @override
  _HomePagezState createState() => _HomePagezState();
}

class _HomePagezState extends State<HomePagez> {
   static List<String> categories = ['1', '2', '3'];
  static List<List<String>> subCategories = [
    ['a', 'b', 'c'],
    ['d', 'e', 'f'],
    ['g', 'h', 'i']
  ];
  static List<bool> activeCategories = List.filled(categories.length, false);
  @override
  Widget build(BuildContext context) {
    return
 Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        activeCategories[index] =
                            activeCategories.elementAt(index) == true
                                ? false
                                : true;
                      });
                    },
                    child: Text(
                      categories.elementAt(index),
                    ),
                  ),
                ),
              ),
              activeCategories.elementAt(index)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      itemBuilder: (context, subIndex) {
                        return SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(subCategories
                                .elementAt(index)
                                .elementAt(subIndex)),
                          ),
                        );
                      },
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }
}