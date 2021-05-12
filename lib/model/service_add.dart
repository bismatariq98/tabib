
import 'package:cloud_firestore/cloud_firestore.dart';


class Services {

  Services(
      {
      this.ref,this.serviceProvideName,this.actualPrice,
      this.description,this.discountedPrice,this.id,
     this.serviceName,this.category,this.subCategory,this.approved,
      });

  String serviceProvideName;
  String id;
  String serviceName;
  String description;
  String actualPrice;
  String discountedPrice;
  DocumentReference ref;

  String displayImage;
  String timing;
  String category;
  bool approved;
  String subCategory;
 

  

  factory Services.fromDocumentSnapShot(DocumentSnapshot doc) => Services(
      serviceProvideName: doc.data()["serviceProviderName"],
      id: doc.data()["id"],
      serviceName: doc.data()["serviceName"],
      description: doc.data()["description"],
     actualPrice: doc.data()["actualPrice"],
     discountedPrice: doc.data()["discountedPrice"],
     ref: doc.reference,
     category: doc.data()["category"],
     subCategory: doc.data()["subCategory"],
     approved:doc.data()["approved"],

       
  );

  Map<String, dynamic> toMap() => {
        "serviceProviderName": serviceProvideName,
        "id": id,
        "serviceName": serviceName,
        "description": description,
        "actualPrice": actualPrice,
        "discountedPrice":discountedPrice,
        "ref":ref,
        "category":category,
        "subCategory":subCategory,
        "displayImage":displayImage,
        "timing":timing,
        "approved":approved,
      };
}