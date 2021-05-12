import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tabib/controller/loading_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/service_provider_model.dart';

class UserController extends GetxController {
          
        ServiceProvider serviceProvider =  new ServiceProvider();
   Loader loader = Get.put(Loader());
      TextEditingController serviceProviderNameController =  TextEditingController();
       TextEditingController cityController =  TextEditingController();
        TextEditingController streetNameController =  TextEditingController();
         TextEditingController phoneNumberController =  TextEditingController();
         TextEditingController emailController =  TextEditingController();
         TextEditingController passwordController =  TextEditingController();


     TextEditingController complaintController =  TextEditingController();
clearForm(){
  serviceProviderNameController.text = '';
  cityController.text = '';
  streetNameController.text = '';
  phoneNumberController.text = '';
  emailController.text = '';
  passwordController.text = '';

}
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    bool status1 = false;
    bool isLoading = false;

    addClinic()  async{
      isLoading = true;
              loader.loadingShow();   
              //  loading.loadingShow();
      
      serviceProvider.email = emailController.text;
      serviceProvider.phoneNumber = phoneNumberController.text;
      serviceProvider.serviceProvideName = serviceProviderNameController.text;
      serviceProvider.city = cityController.text;
      serviceProvider.streetName = streetNameController.text;
            await FirebaseFirestore.instance.collection("clinicapproval").doc(serviceProvider.phoneNumber).set({
               "serviceProviderEmail":serviceProvider.email,
               "serviceProviderName":serviceProvider.serviceProvideName,
               "serviceProviderCity":serviceProvider.city,
               "serviceProviderPhone":serviceProvider.phoneNumber,
               "serviceProviderStreet":serviceProvider.streetName,
               "approved":false,
            }
            ).then((value)  {
               isLoading = false;
               update();
              clearForm();
            });
              
    }


}