import 'package:eazy_booking/app/utils/constants.dart';
import 'package:eazy_booking/app/utils/scale_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/booking_page_controller.dart';

class BookingPageView extends GetView<BookingPageController> {
  BookingPageView({Key? key}) : super(key: key);
  ScalingUtility scale = ScalingUtility(context: Get.context!)
    ..setCurrentDeviceSize();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height / 2.7,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              ConstantData.backgroundTile,
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      padding: scale.getPadding(all: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: scale.getScaledHeight(180),
                          ),
                          Container(
                            padding: scale.getPadding(all: 20),
                            height: Get.height / 1.8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.outer,
                                )
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Phone",
                                    ),
                                    controller: controller.phoneController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if(value!.length == 10 && int.tryParse(value) != null){
                                        return null;
                                      }else{
                                        return "Please enter a valid phone number";
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Username",
                                    ),
                                    controller: controller.usernameController,
                                    validator: (value) {
                                      if(value!.isNotEmpty){
                                        return null;
                                      }else{
                                        return "Please enter a valid name";
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Size",
                                    ),
                                    controller: controller.sizeController,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if(value!.isNotEmpty  && int.tryParse(value) != null && int.parse(value) > 0){
                                        return null;
                                      }else{
                                        return "Please enter a valid party size";
                                      }
                                    },
                                  ),
                                  ElevatedButton(
                                    child: const Text('Booking Date'),
                                    onPressed: () {
                                      dateTimePickerWidget(context);
                                    },
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if(formKey.currentState!.validate()){
                                        controller.bookTable();
                                      }
                                    },
                                    child: const Text("Sign in"),
                                  ),

                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  dateTimePickerWidget(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: DateTime.now(),
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        // final selIOS = DateFormat('dd-MMM-yyyy - HH:mm').format(selectdate);
        controller.bookingModel.bookingDate = dateTime;
      },
    );
  }
}
