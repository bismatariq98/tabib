import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
 
   TextEditingController smsController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  
String _verificationId;
      
    
      
      PhoneVerificationCompleted verificationCompleted =
    (PhoneAuthCredential phoneAuthCredential) async {
  await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
  Get.snackbar("Verifucation", "Verification Complete");
  
};
 




    PhoneVerificationFailed verificationFailed =
    (FirebaseAuthException authException) {
      Get.snackbar("Verification Failed", "Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}");
  
};



PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
    (String verificationId) {
      Get.snackbar("Verification", "Verification Code is : +  $verificationId" );
  
  _verificationId = verificationId;
};

PhoneCodeSent codeSent =
    (String verificationId, [int forceResendingToken]) async {
        Get.snackbar("code sent","Please check your phone for the verification code." );

  _verificationId = verificationId;
};

phoneSignIn() async{
try {
  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
} catch (e) {
  Get.snackbar("title", "messag");
}

}



void signInWithPhoneNumber() async {
  try {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsController.text,
    );

    final User user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
     Get.snackbar("title", "Successfully signed in UID: ${user.uid}");
    
  } catch (e) {
 Get.snackbar("title", "$e");
  }
}


// class UserSignIn extends GetxController{
//   TextEditingController smsController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();

//   void signInWithPhoneNumber() async {
//   try {
//     final AuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: _verificationId,
//       smsCode: smsController.text,
//     );
//     final User user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
//     Get.snackbar("Sign in","Successfully signed in UID: ${user.uid}");
//   } catch (e) {
//     Get.snackbar("Sign In","Failed to sign in: " + e.toString());
//   }
// }
//  String _verificationId;
//     FirebaseAuth auths = FirebaseAuth.instance;
//    codeSent(){
//    PhoneCodeSent 
//     (String verificationId, [int forceResendingToken]) async {
//  Get.snackbar("Code", "Code Sent successfully");
//     _verificationId = verificationId;
//     update();
// };
//    }
//    completeverify(){
// PhoneVerificationCompleted 
//     (PhoneAuthCredential phoneAuthCredential) async {
//   await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
//   Get.snackbar("Verification Complete", "The verification is succeffully completed");
// };
//    }
//    phoneVerify(){
//   PhoneVerificationFailed 
//  (FirebaseAuthException e) {
//     if (e.code == 'invalid-phone-number') {
//       print('The provided phone number is not valid.');
//       Get.snackbar("Error", "Phone number is not valied");
//     }
//   };
//    }
//     codeAuto(){
// PhoneCodeAutoRetrievalTimeout 
//     (String verificationId) {
//   Get.snackbar("Timeout", "Reterival Timeout + $verificationId");
//   _verificationId  = verificationId;
//   update();
// };

//     }
//   signInPhone () async {
//   try {
// await FirebaseAuth.instance.verifyPhoneNumber(
//   phoneNumber: phoneController.text,
//   verificationCompleted:  completeverify(),
//   verificationFailed: phoneVerify(),
//   codeSent: codeSent(),
//   codeAutoRetrievalTimeout: codeAuto(),
//   timeout: const Duration(seconds: 5),
// );
//   }
//   catch(e){
//     Get.snackbar("Error","Failed to verify the number $e");
//   }

//   }
// }