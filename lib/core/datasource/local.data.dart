import 'package:my_project/core/interfaces/local.interface.dart';
import 'package:my_project/core/models/signInResponse.model.dart';
import 'package:shared_preferences/shared_preferences.dart';


const _id = 'id';
const _name = 'name';
const _username = 'username';
const _email = 'email';
const _birthday = 'birthday';
const _biography = 'biography';
class LocalData implements LocalDataInterface{
  @override
  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<void> updateBasicInfo(UserInfo user) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_username, user.username ?? 'username');
    sharedPreferences.setString(_email, user.email ?? 'email');
    sharedPreferences.setString(_birthday, user.birthday.toString());
    sharedPreferences.setString(_biography, user.biography ?? 'biography');
  }

  @override
  Future<UserInfo?> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final id = sharedPreferences.getString(_id);
    final name = sharedPreferences.getString(_name);
    final username = sharedPreferences.getString(_username);
    final email = sharedPreferences.getString(_email);
    final birthday = sharedPreferences.getString(_birthday);
    final biography = sharedPreferences.getString(_biography);

    if(id == null)
      return null;

    final user = new UserInfo(
      biography: biography,
      birthday: DateTime.parse(birthday!),
      email: email,
      id: id,
      name: name,
      username: username
    );

    return user;

  }

  @override
  Future<UserInfo> saveUser(UserInfo user) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_id, user.id ?? 'xd');
    sharedPreferences.setString(_name, user.name ?? 'test');
    sharedPreferences.setString(_username, user.username ?? 'username');
    sharedPreferences.setString(_email, user.email ?? 'email');
    sharedPreferences.setString(_birthday, user.birthday.toString());
    sharedPreferences.setString(_biography, user.biography ?? 'biography');

    return user;
  }

}