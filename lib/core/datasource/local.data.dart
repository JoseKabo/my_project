import 'package:my_project/core/interfaces/local.interface.dart';
import 'package:my_project/core/models/signInResponse.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData implements LocalDataInterface{
  @override
  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<UserInfo> saveUser() {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

}