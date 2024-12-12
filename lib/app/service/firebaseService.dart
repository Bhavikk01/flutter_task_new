
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazy_booking/app/models/BookingModel.dart';
import 'package:eazy_booking/app/models/enum/enumConverter.dart';
import 'package:eazy_booking/app/models/restaurantModel.dart';
import 'package:eazy_booking/app/models/userModel.dart';
import 'package:eazy_booking/app/service/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxController {
  static FirebaseService get to => Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> addUser(UserModel user) async {
    await fireStore.collection("Users").doc(user.uid).set(user.toJson());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await fireStore.collection("Users").doc(uid).get();
    return doc.exists ? UserModel.fromJson(doc.data()!) : null;
  }

  Future<bool> handleSignInByEmail(String email, String password) async {
    UserModel? userModel;
    try {
      UserCredential userValue = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      userModel = await getUser(userValue.user!.uid);
      await UserStore.to.saveProfile(userModel!.uid ?? '');
      return true;
    } catch (e) {
      log('$e Occurred');
      Get.snackbar("Authentication", e.toString());
      return false;
    }
  }

  Future<bool> handleSignUpByEmail(String email, String password,
      String username, String phoneNumber) async {
    UserModel? userModel;
    // try {
      UserCredential userValue = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userValue.user != null){
        userModel = UserModel(
            uid: userValue.user!.uid,
            username: username,
            email: email,
            password: password,
            phone: phoneNumber,
            userType: UserType.USER
        );
        await addUser(userModel);
        await UserStore.to.saveProfile(userModel.uid ?? '');
        return true;
      }else{
        return false;
      }

    // } catch (e) {
    //   Get.snackbar("Authentication", e.toString());
    //   log('$e Occurred');
    //   return false;
    // }
  }

  Future<void> bookTable(
      String rid, BookingModel booking, int newAvailable) async {
    String bookingId = fireStore.collection('Bookings').doc().id;
    booking = booking.copyWith(bookingId: bookingId);
    updateRestaurantAvailableTable(rid, newAvailable);
    return await fireStore
        .collection('Bookings')
        .doc(booking.bookingId)
        .set(booking.toJson());


  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMyBooking() async {
    return await fireStore
        .collection("Bookings")
        .where('uid', isEqualTo: UserStore.to.uid)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllBookings() async {
    return await fireStore
        .collection("Bookings")
        .where("rid", isEqualTo: UserStore.to.uid)
        .get();
  }

  updateBookingStatus(String bookingId, BookingStatus bookingStatus) {
    return fireStore
        .collection("Bookings")
        .doc(bookingId)
        .update({
      "bookingStatus": EnumConverter.toMapBookingStatus(bookingStatus)
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getRestaurant(String rid) async {
    return await fireStore
        .collection("Restaurants")
        .doc(rid)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllRestaurants() async {
    return await fireStore
        .collection("Restaurants")
        .get();
  }

  void updateRestaurantAvailableTable(String rid, int? size) async {
    await fireStore
        .collection("Restaurants")
        .doc(rid)
        .update({
      "availableSize": size,
    });
  }
}
