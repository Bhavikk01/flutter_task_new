import 'package:eazy_booking/app/models/BookingModel.dart';

class EnumConverter{
  static BookingStatus fromMapBookingStatus(String bookingStatus){
    if(bookingStatus == 'PENDING'){
      return BookingStatus.PENDING;
    }else if(bookingStatus == 'SUCCESS'){
      return BookingStatus.SUCCESS;
    }else {
      return BookingStatus.CANCELLED;
    }
  }

  static String toMapBookingStatus(BookingStatus bookingStatus){
    if (bookingStatus == BookingStatus.PENDING) {
      return 'PENDING';
    } else if (bookingStatus == BookingStatus.SUCCESS) {
      return 'SUCCESS';
    } else if (bookingStatus == BookingStatus.CANCELLED) {
      return 'CANCELLED';
    }else{
      return '';
    }
  }
}