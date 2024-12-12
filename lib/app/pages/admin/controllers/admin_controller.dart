import 'dart:developer';

import 'package:eazy_booking/app/models/BookingModel.dart';
import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {

  RxList<BookingModel> bookings = <BookingModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchBookings();
  }

  Future<void> fetchBookings() async {
    try {
      var data = await FirebaseService.to.getAllBookings();
      if (data.docs.isEmpty) {
        bookings.clear();
        log('No bookings present');
      } else {
        for (var element in data.docs) {
          var booking = BookingModel.fromJson(element.data());
          bookings.add(booking);
        }
      }
    } on Exception catch (e) {
      log('Failed to fetch bookings: $e');
    }
  }
}
