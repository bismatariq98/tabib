
import 'package:cloud_firestore/cloud_firestore.dart';
class ServiceProvider {
  ServiceProvider(
      {
        this.serviceProvideName,
   
      this.city,
      this.streetName,
      this.phoneNumber,
      this.email,
       this.approved,
       this.ref,
      });

  String serviceProvideName;
 
  String city;
  String streetName;
  String phoneNumber;
  bool approved;
  DocumentReference ref;
  String email;
 

  factory ServiceProvider.fromDocumentSnapShot(DocumentSnapshot doc) => ServiceProvider(
      serviceProvideName: doc.data()["serviceProviderName"],
      city: doc.data()["serviceProviderCity"],
      streetName: doc.data()["serviceProviderStreet"],
      phoneNumber: doc.data()["serviceProviderPhone"],
     email: doc.data()["serviceProviderEmail"],
     approved: doc.data()["approved"],
     ref: doc.reference
     
  );

  Map<String, dynamic> toMap() => {
        "serviceProviderName": serviceProvideName,
        "serviceProviderCity": city,
        "serviceProviderStreet": streetName,
        "serviceProviderPhone": phoneNumber,
        "serviceProviderEmail": email,
        "approved":approved,
       
      };
}
