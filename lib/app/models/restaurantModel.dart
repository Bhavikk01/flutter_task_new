class RestaurantModel {
  final String? rid;
  final String? restaurantName;
  final String? address;
  final String? phone;
  final String? image;
  final int? rating;
  final int? availableSize;
  final int? totalCapacity;

  RestaurantModel({
    this.rid,
    this.restaurantName,
    this.address,
    this.phone,
    this.rating,
    this.image,
    this.availableSize,
    this.totalCapacity,
  });

  RestaurantModel copyWith({
    String? rid,
    String? restaurantName,
    String? address,
    String? phone,
    String? image,
    int? availableSize,
    int? totalCapacity,
    int? rating,
  }) {
    return RestaurantModel(
      rid: rid ?? this.rid,
      restaurantName: restaurantName ?? this.restaurantName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      availableSize: availableSize ?? this.availableSize,
      totalCapacity: totalCapacity ?? this.totalCapacity,
      rating: rating ?? this.rating,
    );
  }

  RestaurantModel.fromJson(Map<String, dynamic> json)
      : rid = json['rid'] as String?,
        restaurantName = json['restaurantName'] as String?,
        address = json['address'] as String?,
        phone = json['phone'] as String?,
        image = json['image'] as String?,
        rating = json['rating'] as int?,
        availableSize = json['availableSize'] as int?,

        totalCapacity = json['totalCapacity'] as int?;


  Map<String, dynamic> toJson() => {
    'rid' : rid,
    'restaurantName' : restaurantName,
    'address' : address,
    'phone' : phone,
    'image' : image,
    'availableSize' : availableSize,
    'totalCapacity' : totalCapacity,
    'rating' : rating,
  };
}