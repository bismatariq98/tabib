
import 'package:cloud_firestore/cloud_firestore.dart';
class ServiceProvider {
  ServiceProvider(
      {
        this.serviceProvideName,
   
      this.city,
      this.streetName,
      this.phoneNumber,
      this.email,
      
      });

  String serviceProvideName;
 
  String city;
  String streetName;
  String phoneNumber;
  
  String email;
 

  factory ServiceProvider.fromDocumentSnapShot(DocumentSnapshot doc) => ServiceProvider(
      serviceProvideName: doc.data()["serviceProviderName"],
      city: doc.data()["city"],
      streetName: doc.data()["streetName"],
      phoneNumber: doc.data()["phoneNumber"],
     email: doc.data()["email"],
     
  );

  Map<String, dynamic> toMap() => {
        "serviceProviderName": serviceProvideName,
        "city": city,
        "streetName": streetName,
        "phoneNumber": phoneNumber,
        "email": email,
       
      };
}
