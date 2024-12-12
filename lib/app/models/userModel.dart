
class UserModel {
  final String? username;
  final String? email;
  final String? uid;
  final String? password;
  final String? phone;
  final UserType? userType;

  UserModel({
    this.username,
    this.email,
    this.uid,
    this.password,
    this.phone,
    this.userType
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? uid,
    String? password,
    String? phone,
    UserType? userType
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      userType: userType ?? this.userType,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : username = json['username'] as String?,
        email = json['email'] as String?,
        uid = json['uid'] as String?,
        password = json['password'] as String?,
        phone = json['phone'] as String?,
        userType = (json['userType'] == 'USER' ? UserType.USER : UserType.ADMIN);

  Map<String, dynamic> toJson() => {
    'username' : username,
    'email' : email,
    'uid' : uid,
    'password' : password,
    'phone' : phone,
    'userType' : userType == UserType.USER ? 'USER' : 'ADMIN'
  };
}

enum UserType{
  USER,
  ADMIN,
}