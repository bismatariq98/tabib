import 'package:tabib/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabib/screen/bookings.dart';
import 'package:tabib/screen/offer_detail.dart';
import 'package:tabib/screen/pictures.dart';
import 'package:tabib/screen/reviews.dart';

class OfferInfo extends StatefulWidget {
  String serviceName,
      serviceDescription,
      actualPrice,
      discountedPrice,
      clinicLocation;
  OfferInfo(
      {this.clinicLocation,
      this.discountedPrice,
      this.actualPrice,
      this.serviceName,
      this.serviceDescription});
  @override
  _OfferInfoState createState() => _OfferInfoState();
}

class _OfferInfoState extends State<OfferInfo>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TabController _tabController;
  TabBar get _tabs => TabBar(
        controller: _tabController,
        indicatorColor: Colors.pink,
        labelColor: Colors.pink,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            text: "Detail",
          ),
          Tab(
            text: "Booking",
          ),
          Tab(
            text: "Review",
          ),
          Tab(
            text: "Info",
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("0909"),
        backgroundColor: Colors.pink,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.message_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.share_outlined), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.favorite_border_outlined), onPressed: () {}),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Container(
              height: 250,
              width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/offer.png"), fit: BoxFit.cover)),
            ),
            Container(
              height: 70,
              width: Get.width,
              child: PreferredSize(
                  child: ColoredBox(
                    color: Colors.grey[200],
                    child: _tabs,
                  ),
                  preferredSize: _tabs.preferredSize),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                OfferDetail(
                  serviceName: widget.serviceName,
                  serviceDescription: widget.serviceDescription,
                  actualPrice: widget.actualPrice,
                  discountedPrice: widget.discountedPrice,
                  clinicLocation: widget.clinicLocation,
                ),
                Bookings(),
                Reviews(),
                Pictures(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
