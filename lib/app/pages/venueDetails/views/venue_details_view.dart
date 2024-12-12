import 'package:eazy_booking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/venue_details_controller.dart';

class VenueDetailsView extends GetView<VenueDetailsController> {
  const VenueDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.BOOKING_PAGE, parameters: {'rid': controller.rid});
        },
        child: const Chip(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.fromLTRB(55, 12, 55, 12),
            label: Text("book now",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            right: 15.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
            ),
          ),
          buildAvatar(105.0,
              "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          buildAvatar(85.0,
              "https://images.pexels.com/photos/532220/pexels-photo-532220.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          buildAvatar(65.0,
              "https://images.pexels.com/photos/1984117/pexels-photo-1984117.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          buildAvatar(45.0,
              "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 25.0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.circular(20.0),
              ),
              alignment: Alignment.center,
              child: const Text(
                "4.5",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 25.0,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2))
                    ]),
                    child: const Text(
                      "176 reviews, 10 Friends",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Sys Brunch",
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildItemRow(context),
                    buildItemRow(context),
                    buildItemRow(context),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildItemRow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Vegetables",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: const Text(
                  "You should consume 2 1/2 cups of vegetables per day according",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Positioned buildAvatar(double leftPosition, String url) {
    return Positioned(
      top: 60,
      left: leftPosition,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: Colors.white),
        ),
      ),
    );
  }
}
