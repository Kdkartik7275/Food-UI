// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  String? fullName;
  String? email;
  String? userID;

  String? phone;
  UserEntity({
    this.fullName,
    this.email,
    this.userID,
    this.phone,
  });

  @override
  List<Object?> get props => [userID];
}
