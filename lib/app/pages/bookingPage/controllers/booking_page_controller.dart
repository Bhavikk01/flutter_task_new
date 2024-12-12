import 'dart:developer';

import 'package:eazy_booking/app/models/BookingModel.dart';
import 'package:eazy_booking/app/models/restaurantModel.dart';
import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:eazy_booking/app/service/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookingPageController extends GetxController {

  String rid = '';
  BookingModel bookingModel = BookingModel();
  TextEditingController sizeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void onInit() {
    rid = Get.parameters['rid']?? '';
    log(rid + 'is the restauratn id');
    super.onInit();
  }

  Future<void> bookTable() async {
    var data = await FirebaseService.to.getRestaurant(rid);
    RestaurantModel restaurant = RestaurantModel.fromJson(data.data()!);
    bookingModel = bookingModel.copyWith(
      phone: phoneController.text,
      bookingStatus: BookingStatus.PENDING,
      createdAt: DateTime.now(),
      rid: restaurant.rid,
      size: int.parse(sizeController.text),
      uid: UserStore.to.uid,
      username: usernameController.text,
    );
    if(bookingModel.size! <= restaurant.availableSize!){
      await FirebaseService.to.bookTable(rid, bookingModel, restaurant.availableSize! - bookingModel.size!);
      Get.back();
      Get.snackbar(restaurant.restaurantName?? '',  "Restaurant table booking is placed");
    }else{
      Get.snackbar(restaurant.restaurantName?? '',  "Restaurant tables are not available");
    }
  }
}
