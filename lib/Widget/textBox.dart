import 'package:flutter/services.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget textBox( {text='',validator,keyboadType,controller,}) {

  return TextFormField(
              controller: controller,
              validator: validator,
                decoration: new 
            InputDecoration(
                labelText: text,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                 
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
),
          
                keyboardType: keyboadType,
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              );
}