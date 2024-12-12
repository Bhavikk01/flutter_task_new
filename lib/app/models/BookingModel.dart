import 'package:eazy_booking/app/models/enum/enumConverter.dart';

class BookingModel {
  String? bookingId;
  String? uid;
  String? rid;
  String? phone;
  String? username;
  DateTime? createdAt;
  DateTime? bookingDate;
  int? size;
  BookingStatus? bookingStatus;

  BookingModel({
    this.bookingId,
    this.uid,
    this.rid,
    this.phone,
    this.username,
    this.createdAt,
    this.bookingDate,
    this.size,
    this.bookingStatus
  });

  BookingModel copyWith({
    String? bookingId,
    String? uid,
    String? rid,
    String? phone,
    String? username,
    DateTime? createdAt,
    DateTime? bookingDate,
    int? size,
    BookingStatus? bookingStatus
  }) {
    return BookingModel(
      bookingId: bookingId ?? this.bookingId,
      uid: uid ?? this.uid,
      rid: rid ?? this.rid,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      createdAt: createdAt ?? this.createdAt,
      bookingDate: bookingDate ?? this.bookingDate,
      size: size ?? this.size,
      bookingStatus: bookingStatus ?? this.bookingStatus
    );
  }

  BookingModel.fromJson(Map<String, dynamic> json)
      : bookingId = json['bookingId'] as String?,
        uid = json['uid'] as String?,
        rid = json['rid'] as String?,
        phone = json['phone'] as String?,
        username = json['username'] as String?,
        createdAt = DateTime.parse(json['createdAt'] ?? ''),
        bookingDate = DateTime.parse(json['bookingDate'] ?? ''),
        bookingStatus = EnumConverter.fromMapBookingStatus(json['bookingStatus']?? ''),
        size = json['size'] as int?;


  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'uid': uid,
      'rid': rid,
      'phone': phone,
      'username': username,
      'createdAt': createdAt!.toIso8601String(),
      'bookingDate': bookingDate!.toIso8601String(),
      'size': size,
      'bookingStatus': EnumConverter.toMapBookingStatus(bookingStatus!)
    };
  }
}

enum BookingStatus{
  SUCCESS,
  PENDING,
  CANCELLED
}