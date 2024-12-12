import 'dart:developer';

import 'package:eazy_booking/app/models/restaurantModel.dart';
import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxList<RestaurantModel> restaurants = <RestaurantModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      var data = await FirebaseService.to.getAllRestaurants();
      if (data.docs.isEmpty) {
        restaurants.clear();
        log('No bookings present');
      } else {
        for (var element in data.docs) {
          var restaurant = RestaurantModel.fromJson(element.data());
          restaurants.add(restaurant);
        }
      }
    } on Exception catch (e) {
      log('Failed to fetch bookings: $e');
    }
  }
}
