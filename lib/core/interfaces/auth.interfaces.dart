import 'package:my_project/core/models/signInResponse.model.dart';

abstract class AuthInterface {
  Future<void> logOut(String idUser);

}