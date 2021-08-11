import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tabib/controller/loading_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/service_provider_model.dart';
import 'package:tabib/model/userdata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tabib/provider/clinic_provider.dart';
import 'package:tabib/screen/settings/addClininc.dart';
import 'package:tabib/screen/settings/clinic/clinic_homepage.dart';

class UserController extends GetxController {
  UserModel userData = UserModel();
  String errorMessage;
  ServiceProvider serviceProvider = new ServiceProvider();
  Loader loader = Get.put(Loader());
  TextEditingController serviceProviderNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController signUpemailController = TextEditingController();
  TextEditingController signUppasswordController = TextEditingController();

  TextEditingController complaintController = TextEditingController();

  Future signIn() async {
    UserCredential userCredential;

    try {
      loader.loadingShow();
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      currentUserId = userCredential.user.uid.toString();
      update();
      loader.loadingDismiss();
      clearForm();
      Get.to(() => AddClinic());

      // updateToken(currentUserId);
    } catch (e) {
      print(e.toString());
      // errorMessage = e.message;
      loader.loadingDismiss();
      Get.snackbar('Error', e.message);
      update();
    }
  }

  clearForm() {
    serviceProviderNameController.text = '';
    cityController.text = '';
    streetNameController.text = '';
    phoneNumberController.text = '';
    emailController.text = '';
    passwordController.text = '';
    signUpemailController.text;
    signUppasswordController.text;
  }

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool status1 = false;
  bool isLoading = false;
  DocumentReference docReference;
  String currentUserId;

  /* ------------------------------ sign up user ------------------------------ */
  Future addUserData() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    firebaseMessaging.subscribeToTopic("Topic");
    String token = await firebaseMessaging.getToken();

    FirebaseFirestore.instance.collection('Users').doc(currentUserId).set(
      {
        'UserId': currentUserId,
        'Email': userData.email,
        "token": token,
      },
    );
    return true;
  }

  signUp() async {
    loader.loadingShow();

    //add data into model object from controller

    userData.email = signUpemailController.text;

    // userData.userId = user.user.uid;
    // User user = FirebaseAuth.instance.currentUser;
    try {
      var user = await firebaseAuth.createUserWithEmailAndPassword(
          email: userData.email, password: signUppasswordController.text);

      currentUserId = user.user.uid.toString();
      print(currentUserId);
      // update();

      addUserData().then((val) {
        loader.loadingDismiss();
        clearForm();
        Get.snackbar('Success', 'Sign up SuccessFully');
        Get.to(AddClinic());
      });
    } catch (e) {
      errorMessage = e.message;
      loader.loadingDismiss();
      update();
      Get.snackbar('Error', e.message);
    }
  }

  addClinic(
    dayTiming,
    BuildContext context,
  ) async {
    isLoading = true;
    loader.loadingShow();

    serviceProvider.email = emailController.text;
    serviceProvider.phoneNumber = phoneNumberController.text;
    serviceProvider.serviceProvideName = serviceProviderNameController.text;
    serviceProvider.city = cityController.text;
    serviceProvider.streetName = streetNameController.text;
    serviceProvider.documentId = FirebaseFirestore.instance
        .collection("clinicapproval")
        .doc(currentUserId)
        .id
        .toString();
    Provider.of<ClinicProvider>(context, listen: false)
        .changeCurrentUserId(currentUserId);

    await FirebaseFirestore.instance
        .collection("clinicapproval")
        .doc(currentUserId)
        .set({
      "serviceProviderEmail": serviceProvider.email,
      "serviceProviderName": serviceProvider.serviceProvideName,
      "serviceProviderCity": serviceProvider.city,
      "serviceProviderPhone": serviceProvider.phoneNumber,
      "serviceProviderStreet": serviceProvider.streetName,
      // "clinicDoc":doc.reference,
      "approved": false,
      "timing": dayTiming,
      "documentId": serviceProvider.documentId,
      "userId": currentUserId
    }).then((value) {
      isLoading = false;
      update();
      clearForm();
    });
  }

  Future updateClinicBooking(dayTime) async {
    isLoading = true;
    loader.loadingShow();
    //  loading.loadingShow();

    serviceProvider.email = emailController.text;
    serviceProvider.phoneNumber = phoneNumberController.text;
    serviceProvider.serviceProvideName = serviceProviderNameController.text;
    serviceProvider.city = cityController.text;
    serviceProvider.streetName = streetNameController.text;
    serviceProvider.documentId = FirebaseFirestore.instance
        .collection("clinicapproval")
        .doc(currentUserId)
        .id
        .toString();

    await FirebaseFirestore.instance
        .collection("clinicapproval")
        .doc(currentUserId)
        .update({
      "timing": dayTime,
      "documentId": serviceProvider.documentId,
    }).then((value) {
      isLoading = false;
      update();
      clearForm();
    });
  }
}
