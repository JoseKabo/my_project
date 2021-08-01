import 'package:my_project/core/models/signInResponse.model.dart';

abstract class LocalDataInterface {
  Future<void> clearData();
  Future<UserInfo> saveUser( UserInfo user );
  Future<UserInfo?> getUser();
}