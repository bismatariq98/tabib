import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:tabib/controller/loading_controller.dart';
import 'package:tabib/screen/settings/AdminScreens/adminLogin.dart';
import 'package:tabib/screen/settings/AdminScreens/admin_home_Screen.dart';
import 'package:tabib/model/service_provider_model.dart';

import '../model/service_add.dart';
import '../model/service_provider_model.dart';



class AdminController extends GetxController {
    ServiceProvider serviceProvider = ServiceProvider();
    Services services = Services();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    List<ServiceProvider> approvalWaiting = [];
    List<Services> servicesApprovalWaiting = [];
    List<ServiceProvider> approvedClinic = [];
    List<Services> serviceApproved = [];
   Loader loader = Get.put(Loader());
   TextEditingController loginEmailController = TextEditingController();
    TextEditingController loginPasswordController = TextEditingController();
var currentUserId;
  Future signIn() async {
    UserCredential userCredential;
    try {
      loader.loadingShow();
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      currentUserId = userCredential.user.uid.toString();
      loader.loadingDismiss();
      Get.to(()=> AdminHomeScreen() );

      // updateToken(currentUserId);
    } catch (e) {
      print(e.toString());
      // errorMessage = e.message;
      loader.loadingDismiss();
      Get.snackbar('Error', e.message);
      update();
    }
  }


     showApprovedService()async{
       serviceApproved.clear();
      await  FirebaseFirestore.instance.collection("AddService").where('approved', isEqualTo:true).get().then((value)  {
       if(value.size > 0){
         value.docs.forEach((element) {
            var serviceApprovedVar = Services.fromDocumentSnapShot(element);
            serviceApproved.add(serviceApprovedVar);
            print(serviceApproved);
         });
         update();
         
        
       }
      });
     }   

     showclinicApproved()async{
       approvedClinic.clear();
      await  FirebaseFirestore.instance.collection("clinicapproval").where('approved', isEqualTo:true).get().then((value)  {
       if(value.size > 0){
         value.docs.forEach((element) {
            var approvedClinicQuery = ServiceProvider.fromDocumentSnapShot(element);
            approvedClinic.add(approvedClinicQuery);
         });
         update();
        
       }
      });
     }





   showServiceData()async{
     servicesApprovalWaiting.clear();
    await FirebaseFirestore.instance.collection("AddService").get().then((value) {
      if(value.size > 0){
         value.docs.forEach((element) {
            var approvalService = Services.fromDocumentSnapShot(element);
              servicesApprovalWaiting.add(approvalService);
          });
          update();
      }
    });
   }

    showData () async{
        approvalWaiting.clear();
      await FirebaseFirestore.instance.collection("clinicapproval").get().then((value) {
       if (value.size > 0 ){
         value.docs.forEach((element) { 
           var approval = ServiceProvider.fromDocumentSnapShot(element);
           approvalWaiting.add(approval);
         });
        update();
       } 
      });
    }
 signout() {
    firebaseAuth.signOut();
    Get.offAll(AdminLogin());
  }
     
}