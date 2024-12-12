import 'package:eazy_booking/app/routes/app_pages.dart';
import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  register() async {
    bool res = await FirebaseService.to.handleSignUpByEmail(
      emailController.text,
      passwordController.text,
      nameController.text,
      phoneController.text,
    );
    if (res) {
      Get.toNamed(Routes.HOME);
    }
  }
}
