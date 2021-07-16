import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  Services(
      {this.ref,
      this.serviceProvideName,
      this.actualPrice,
      this.description,
      this.discountedPrice,
      this.id,
      this.serviceName,
      this.category,
      this.subCategory,
      this.approved,
      this.clinicReference,
      this.clinicLocation,
      this.imagesList,
      
      
      });

  String serviceProvideName;
  String id;
  String serviceName;
  String description;
  String actualPrice;
  String discountedPrice;
  DocumentReference ref;
  String clinicLocation;
  String displayImage;
  String timing;
  String category;
  List imagesList;
  bool approved;
  String subCategory;
  DocumentReference clinicReference;
  factory Services.fromDocumentSnapShot(DocumentSnapshot doc) => Services(
      serviceProvideName: doc.data()["serviceProviderName"],
      imagesList: doc.data()["imagesList"],
      id: doc.data()["id"],
      serviceName: doc.data()["serviceName"],
      description: doc.data()["description"],
      actualPrice: doc.data()["actualPrice"],
      discountedPrice: doc.data()["discountedPrice"],
      ref: doc.reference,
      category: doc.data()["category"],
      subCategory: doc.data()["subCategory"],
      approved: doc.data()["approved"],
      clinicLocation: doc.data()["clinicLocation"],
      clinicReference: doc.data()['clinicReference']);

  Map<String, dynamic> toMap() => {
        "serviceProviderName": serviceProvideName,
        "imagesList":imagesList,
        "id": id,
        "serviceName": serviceName,
        "description": description,
        "actualPrice": actualPrice,
        "discountedPrice": discountedPrice,
        "ref": ref,
        "category": category,
        "subCategory": subCategory,
        "displayImage": displayImage,
        "timing": timing,
        "approved": approved,
        "clinicLocation": clinicLocation,
        "clinicReference": clinicReference
      };
}
