import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assignment/core/common/errors/exceptions/firebase_exceptions.dart';
import 'package:assignment/src/user/data/model/user.dart';

abstract interface class UserRemoteDataSource {
  Future<void> saveUserInfo(
      String email, String userID, String fullName, String phone);

  Future<void> upadateUserData(String userID, Map<String, dynamic> data);

  Future<UserModel> getUserData(String userID);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final FirebaseFirestore _firestore;

  UserRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  @override
  Future<void> saveUserInfo(
      String email, String userID, String fullName, String phone) async {
    try {
      UserModel newUser = UserModel(
          email: email, fullName: fullName, userID: userID, phone: phone);
      await _firestore.collection('Users').doc(userID).set(newUser.toMap());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  @override
  Future<UserModel> getUserData(String userID) async {
    try {
      final userData = await _firestore.collection('Users').doc(userID).get();
      UserModel user = UserModel.fromMap(userData.data()!);

      return user;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  @override
  Future<void> upadateUserData(String userID, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('Users').doc(userID).update(data);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
