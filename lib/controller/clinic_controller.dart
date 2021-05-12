import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabib/controller/loading_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/service_add.dart';
import 'package:tabib/screen/settings/clinic/clinic_homepage.dart';
import 'package:tabib/screen/settings/clinic/clinic_login.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../model/service_add.dart';
import '../model/service_add.dart';
class ClinicController extends GetxController 
{
  TimeRange times;
  List cat =["Dental","Dermatology","Fitness","Spa"];//ya main list hage
Map subCatMap = 
    {
       
        'Dental':[
          'd1','d2','d3',
        ],
        'Dermatology':[
          'Dermatology1','Dermatology2','Dermatology3',
        ],
        'Fitness':[
          'f1','f2','f3',
        ],
        'Spa':[
          's1','s2','s3',
        ],
        
      };//ya category nested k liyay map bna d

  List subCat =[
     'd1','d2','d3',
  ];//eski zrurt q pasih ae ?
  String selectedCat = "Dental";//ya by default ya show hga phlu
  String selectedSubCat ="d1";
 var currentUserId ;

 Services serviceProvider = Services();
  addService()async{
    serviceProvider.serviceName = serviceNameController.text;
    serviceProvider.serviceProvideName = serviceProviderNameController.text;
     serviceProvider.actualPrice = actualPriceController.text;
     serviceProvider.discountedPrice = discountPriceController.text;
     serviceProvider.timing = times.toString();
     serviceProvider.category = selectedCat;
     serviceProvider.subCategory = selectedSubCat;
     try{
    await FirebaseFirestore.instance.collection("AddService").doc(currentUserId).set({
           "serviceName" :serviceProvider.serviceName,
           "serviceProviderName":serviceProvider.serviceProvideName,
           "actualPrice":serviceProvider.actualPrice,
           "discountedPrice":serviceProvider.discountedPrice,
           "timing":serviceProvider.timing,
           "category":serviceProvider.category,
           "subCategory":serviceProvider.subCategory,
           "displayImage":"",
           "id":currentUserId,
           

    });
    Get.snackbar("suucess", "message");
     }
     catch(e){
      Get.snackbar("title",e);

     }


  }
   getSubCat(){
     subCat.clear();
     subCat.addAll(subCatMap[selectedCat]);//addall function ks liyay use hta ?
     selectedSubCat=subCat[0];//ya q lkha phr
     update();
   }

  Loader loader = Get.put(Loader());
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    TextEditingController loginEmailController = TextEditingController();
    TextEditingController loginPasswordController = TextEditingController();
     TextEditingController serviceProviderNameController = TextEditingController();
      TextEditingController serviceNameController = TextEditingController();
      TextEditingController serviceDescriptionController = TextEditingController();
       TextEditingController actualPriceController = TextEditingController();
        TextEditingController discountPriceController = TextEditingController();
   clearForm (){
     loginEmailController.text = '';
     loginPasswordController.text = '';
   }

  Future signIn() async {
    UserCredential userCredential;
   
   
    try {
      loader.loadingShow();
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      currentUserId = userCredential.user.uid.toString();
      loader.loadingDismiss();
      clearForm();
      Get.to(()=> ClinicHomePage() );

      // updateToken(currentUserId);
    } catch (e) {
      print(e.toString());
      // errorMessage = e.message;
      loader.loadingDismiss();
      Get.snackbar('Error', e.message);
      update();
    }
  }

   signout() {
    firebaseAuth.signOut();
    Get.offAll(ClinicLogin());
  }


}