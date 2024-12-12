import 'package:eazy_booking/app/routes/app_pages.dart';
import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signInByEmail() async {
    bool res = await FirebaseService.to.handleSignInByEmail(emailController.text, passwordController.text);
    if(res){
      Get.toNamed(Routes.HOME);
    }
  }
}
