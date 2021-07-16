import 'package:tabib/controller/admin_controller.dart';
import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:get/get.dart';
import 'package:tabib/screen/offerInfo.dart';

class NewOffer extends StatefulWidget {
  @override
  _NewOfferState createState() => _NewOfferState();
}

class _NewOfferState extends State<NewOffer> {
  AdminController adminController = Get.put(AdminController());

  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    adminController.showApprovedService();
    return Scaffold(body: GetBuilder<AdminController>(builder: (_) {
      return Container(
        height: Get.height,
        width: Get.width,
        child: ListView.builder(
            itemCount: _.serviceApproved.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(OfferInfo(
                           
                            serviceName: _.serviceApproved[i].serviceName,
                            serviceDescription:
                                _.serviceApproved[i].description,
                            serviceProviderName:
                                _.serviceApproved[i].serviceProvideName,
                            actualPrice: _.serviceApproved[i].actualPrice,
                            discountedPrice:
                                _.serviceApproved[i].discountedPrice,
                            clinicLocation: _.serviceApproved[i].clinicLocation,
                            imagesList:_.serviceApproved[i].imagesList,
                          ));
                        },
                        child: Container(
                          height: 250,
                          width: Get.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("asset/offer.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Container(
                        color: Colors.white,
                        height: 80,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFA2ABD7)),
                                  child: Center(
                                      child: Text(
                                    "9.3",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                SmoothStarRating(
                                  rating: rating,
                                  isReadOnly: false,
                                  size: 22,
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  color: Colors.yellow,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  onRated: (value) {
                                    print("rating value -> $value");
                                    // print("rating value dd -> ${value.truncate()}");
                                  },
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      _.serviceApproved[i].actualPrice,
                                      style: TextStyle(fontSize: 23),
                                    ),
                                    SizedBox(width: 10),
                                    Text(_.serviceApproved[i].discountedPrice,
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ))
                                  ],
                                ),
                                Text(
                                  _.serviceApproved[i].serviceName,
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  _.serviceApproved[i].serviceProvideName,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        height: 60,
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Color(0xFFA2ABD7),
                              size: 34,
                            ),
                            Expanded(
                                child: Text(
                                    "Heading And descripton lorem ipsumadnlakdlk "))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      );
    }));
  }
}
