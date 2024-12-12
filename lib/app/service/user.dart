import 'dart:developer';

import 'package:eazy_booking/app/routes/app_pages.dart';
import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:eazy_booking/app/service/storage.dart';
import 'package:get/get.dart';

import '../models/userModel.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String uid = '';
  String userIdKey = 'userIdKey';
  String userNameKey = 'userNameKey';
  String userProfilePicKey = 'userProfilePicKey';
  String userEmailKey = 'userEmailKey';
  final _profile = UserModel(
    uid: '',
    email: '',
    phone: '0000000000',
    username: '',
  ).obs;

  bool get isLogin => _isLogin.value;
  UserModel get profile => _profile.value;
  bool get hasToken => uid.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfile();
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString(userIdKey, value);
    uid = value;
  }

  Future<void> getProfile() async {
    uid = StorageService.to.getString(userIdKey);
    if (uid.isNotEmpty) {
      _profile(await FirebaseService.to.getUser(uid));
    }
    log('user data: $_profile');
    _isLogin.value = true;
  }

  Future<void> saveProfile(String profile) async {
    await StorageService.to.setString(userIdKey, profile);
    await getProfile();
    uid = profile;
    log("data is saved: ${_profile.value}");
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userEmailKey);
    await StorageService.to.remove(userIdKey);
    await StorageService.to.remove(userProfilePicKey);
    await StorageService.to.remove(userNameKey);
    _isLogin.value = false;
    uid = '';
    Get.offAllNamed(Routes.LOGIN);
  }
}
