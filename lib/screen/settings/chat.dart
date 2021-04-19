import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/screen/Settings.dart';


class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios,color:Colors.black), onPressed: (){
        Get.off(Settings());
      }),
      ),
      body:Container(
        height: Get.height,
        width: Get.width,

        child: Column(
            
            children:[
               Expanded(child: Container(height: Get.height -200,
               width: Get.width,color: Colors.grey[200],),
                
               ),

               Row(children:[
                 IconButton(icon: Icon(Icons.photo),
                 onPressed: (){

                 },

                 ),
                 Expanded(
                                    child: TextFormField(
                    decoration: InputDecoration.collapsed(
                        
                      hintText: "Send a Message"),
                     
                    textCapitalization: TextCapitalization.sentences,
                   ),
                 ),

                       IconButton(icon: Icon(Icons.send),
                 onPressed: (){

                 },

                 ),
               ])
          ]),
      )
      
    );
  }
}