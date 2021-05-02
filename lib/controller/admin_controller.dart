import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'package:tabib/model/service_provider_model.dart';

class AdminController extends GetxController {
    ServiceProvider serviceProvider = ServiceProvider();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    List<ServiceProvider> approvalWaiting = [];
    showData () async{

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


}