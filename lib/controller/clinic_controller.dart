import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabib/controller/loading_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/model/service_add.dart';
import 'package:tabib/screen/settings/clinic/clinic_homepage.dart';
import 'package:tabib/screen/settings/clinic/clinic_login.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;


import '../model/service_add.dart';
import '../model/service_add.dart';

class ClinicController extends GetxController {

// List<File> _paths = [];
// List<File> _tasks = [];

// Future uploadToFirebase() async {
//     try {
//       _paths.forEach((path) async {
//         File file = File(path);
//         final fileName = Path.basename(file.path);
//         final destination = 'files/$fileName';
//         task = uploadFile(destination, file);
//       //   _tasks.add(task!);
//         if (task == null) return;
//        final snapshot = await task.whenComplete(() {});
//         final urlDownload = await snapshot.ref.getDownloadURL();
//         print('Download-Link: $urlDownload');
//       });
//        setState(() {
//         _tasks.add(task);
//     });
//       //_tasks.add(task!);
//       print('TasksList ${ _tasks.length}');
//     } on PlatformException catch (e) {
//       print(e.toString());
//     }
//   }
// static UploadTask  uploadFile(String destination, File file) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);
//       return ref.putFile(file);
//     } on FirebaseException catch (e) {
//       return null;
//     }
//   }
//   static UploadTask uploadBytes(String destination, Uint8List data) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);
//       return ref.putData(data);
//     } on FirebaseException catch (e) {
//       return null;
//     }
//   }





  TimeRange times;
  List cat = ["Dental", "Dermatology", "Fitness", "Spa"]; //ya main list hage
  Map subCatMap = {
    'Dental': [
      'Caries removal',
      'Crowns',
      'Hollywood smile',
    ],
    'Dermatology': [
      'Laser Treatment',
      'Botox and Filler',
      'Skin Care',
    ],
    'Fitness': [
      'Nutrition',
      'Body carve',
      'Body care',
    ],
    'Spa': [
      's1',
      's2',
      's3',
    ],
  }; //ya category nested k liyay map bna d

  List subCat = [
    'd1',
    'd2',
    'd3',
  ]; //eski zrurt q pasih ae ?
  String selectedCat = "Dental"; //ya by default ya show hga phlu
  String selectedSubCat = "d1";
  String currentUserId;
  bool uploading = false;
  double val = 0;

  firebase_storage.Reference ref;
 
  List<File> image = [];
  final picker = ImagePicker();
  Services serviceProvider = Services();

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    image.add(File(pickedFile?.path));
    update();
    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      image.add(File(response.file.path));
      update();
    } else {
      print(response.file);
    }
  }
  List<String> downloadList = [];

  Future uploadFile(List<File>images,String id) async {
     
    int i = 1;

    for (var img in images) {
      val = i / images.length;
      update();
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        final  download =  await  ref.getDownloadURL();
          print('TasksList ${ download}');
           downloadList.add(download);
            

        // .then((value) {
        //   // print()
        //   FirebaseFirestore.instance
        //       .collection("AddService")
        //       .doc(currentUserId)
        //       .update({'imagesList': value});
        //   i++;
        // });

      });

      
      Get.snackbar("Successfull", "Uploaded Successfully");
    }
    uploadFirestore(downloadList);
  }
  uploadFirestore(List<String> downloadUrl){
  FirebaseFirestore.instance
              .collection("AddService")
              .doc(currentUserId)
              .update({'imagesList': downloadUrl});
              Get.snackbar("title", "UploadSucccesfuill");
  }

  addService() async {
    serviceProvider.serviceName = serviceNameController.text;
    serviceProvider.serviceProvideName = serviceProviderNameController.text;
    serviceProvider.actualPrice = actualPriceController.text;
    serviceProvider.discountedPrice = discountPriceController.text;
    serviceProvider.timing = times.toString();
    serviceProvider.category = selectedCat;
    serviceProvider.subCategory = selectedSubCat;
    serviceProvider.description = description.text;
    try {
      await FirebaseFirestore.instance
          .collection("AddService")
          .doc(currentUserId)
          .set({
        "serviceName": serviceProvider.serviceName,
        "serviceProviderName": serviceProvider.serviceProvideName,
        "actualPrice": serviceProvider.actualPrice,
        "discountedPrice": serviceProvider.discountedPrice,
        "timing": serviceProvider.timing,
        "category": serviceProvider.category,
        "subCategory": serviceProvider.subCategory,
        "displayImage": "",
        "id": currentUserId,
        "description": serviceProvider.description,
        "approved": false,
        "imagesList": "",
      }).then((value) async {
        await uploadFile(image,currentUserId);
      });
      Get.snackbar("suucess", "message");
    } catch (e) {
      Get.snackbar("title", e);
    }
  }

  getSubCat() {
    subCat.clear();
    subCat.addAll(subCatMap[selectedCat]);
    selectedSubCat = subCat[0];
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
  TextEditingController description = TextEditingController();
  TextEditingController clinicLocationController = TextEditingController();

  clearForm() {
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
      update();
      loader.loadingDismiss();
      clearForm();
      Get.to(() => ClinicHomePage());

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

  /* -------------------------------------------------------------------------- */
  /* -------------------------------------------------------------------------- */
  /* -------------------------------------------------------------------------- */
  /* -------------------------------------------------------------------------- */
  /* -------------------------------------------------------------------------- */
  DateTime selectedDate = DateTime.now();
  List clinicTiming = [];
  getTiming(String serviceName) async {
    var queryData = await FirebaseFirestore.instance
        .collection('clinicapproval')
        .where('serviceProviderName', isEqualTo: serviceName)
        .get();
    if (queryData.size > 0) {
      clinicTiming = queryData.docs[0].data()['timing'];
      print(clinicTiming);
    }
  }

  getTodaySlots() {}
}
