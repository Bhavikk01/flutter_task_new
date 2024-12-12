import 'package:eazy_booking/app/service/firebaseService.dart';
import 'package:eazy_booking/app/service/storage.dart';
import 'package:eazy_booking/app/service/user.dart';
import 'package:eazy_booking/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put(FirebaseService());
  Get.put<UserStore>(UserStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: FirebaseAuth.instance.currentUser != null ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}

