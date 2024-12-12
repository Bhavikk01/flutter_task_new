import 'package:get/get.dart';

class VenueDetailsController extends GetxController {
  String rid = '';

  @override
  void onInit() {
    rid = Get.parameters['rid']?? '';
    super.onInit();
  }
}
