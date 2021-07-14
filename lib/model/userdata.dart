import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(
      {
      
      this.userId,
      this.email,
    
      this.refrence,
      this.token,
     
      });


  String userId;
  String email;

  DocumentReference refrence;

  String token;

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) => UserModel(
     
      userId: doc.data()["UserId"],
      email: doc.data()["Email"],
    
      refrence: doc.reference,
      token:doc.data()["token"],
      );

  Map<String, dynamic> toMap() => {
       
        "UserId": userId,
        "Email": email,
       
     
        "token":token,
      };
}