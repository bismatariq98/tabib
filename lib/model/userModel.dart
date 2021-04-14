import 'package:tabib/main.dart';
import 'package:flutter/material.dart';

  class Categories  {
    
    String text;
    IconData icon;
    Color color;
Categories({this.text,this.color,this.icon});
  }


  List<Categories> categories = [
    Categories(color: Colors.green,icon:Icons.location_on_rounded,text: "Offers"),
      Categories(color: Colors.pink,icon:Icons.location_on_rounded,text: "Helo"),
        Categories(color: Colors.blue,icon:Icons.location_on_rounded,text: "Helo"),
          Categories(color: Colors.lime,icon:Icons.location_on_rounded,text: "Helo"),
            Categories(color: Colors.orange,icon:Icons.location_on_rounded,text: "Helo"),
              Categories(color: Colors.green,icon:Icons.location_on_rounded,text: "Helo")
  ];