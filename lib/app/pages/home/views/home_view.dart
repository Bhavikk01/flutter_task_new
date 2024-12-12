import 'package:eazy_booking/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0, top: 45.0, right: 25.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/2787310/pexels-photo-2787310.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.VENUE_DETAILS, parameters: {'rid' : controller.restaurants[index].rid?? ''});
                      },
                      child: buildItem(
                        title: controller.restaurants[index].restaurantName?? '',
                        url: controller.restaurants[index].image?? '',
                        // "https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                        rating: controller.restaurants[index].rating?? 0,
                      ),
                    );
                  },
                  itemCount: controller.restaurants.length,
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  Container buildItem({required String title, required String url, required int rating}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: url,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    rating.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildTopChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        padding: const EdgeInsets.all(8.0),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
