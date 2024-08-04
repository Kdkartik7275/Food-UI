import 'dart:convert';

import 'package:assignment/core/common/entity/user.dart';

class UserModel extends UserEntity {
  UserModel({super.email, super.fullName, super.userID, super.phone});

  UserModel copyWith({
    String? fullName,
    String? email,
    String? userID,
    String? phone,
  }) {
    return UserModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        userID: userID ?? this.userID,
        phone: phone ?? this.phone);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'email': email,
      'userID': userID,
      'phone': phone
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
