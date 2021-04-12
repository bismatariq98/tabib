import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:tabib/screen/HomeScreen.dart';
import 'package:tabib/screen/LoginPage.dart';
import 'package:tabib/screen/Settings.dart';
import 'package:tabib/screen/Appointment.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  List _pages = [
     Text("Hello"),
   Appointment(),
    HomeScreen(),
    LoginPage(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        extendBodyBehindAppBar: true,

        
        bottomNavigationBar:Theme(data: Theme.of(context).copyWith(canvasColor: Colors.white), 
        child: 
      BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
        selectedItemColor: Color(0xFFF38FB1),
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap:(i){
          setState(() {
                   _currentIndex  = i;
                    });
        } ,


        items: 
      [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Profile",
          
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Contact",
          
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.contact_page),
          label: "Contact",
          
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
          
        ),


      ]
      
      )
        ) ,
        body: _pages[_currentIndex],
    );
         
  
    
  }
}
