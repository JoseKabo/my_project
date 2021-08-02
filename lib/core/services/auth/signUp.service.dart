import 'package:http/http.dart' as http;
import 'package:my_project/core/models/SingUpResponse.model.dart';
import 'package:my_project/core/models/signUp.mode.dart';
import 'package:my_project/shared/endpoints.dart';


class SignUpService {
  static var client = http.Client();

  static Future<SharedModelReponse> signUp(
    {required SignUpModel model}
  ) async {
    var uriResponse = await client.post(
      Uri.parse("${Endpoints.dev_external}/auth/signup"),
      body: {
        'name': model.name,
        'username': model.username,
        'email': model.email,
        'birthday': model.birthday.toIso8601String(),
        'password': model.password
      }
    );
    if( uriResponse.statusCode == 200 ){
      var jsonResponse = uriResponse.body;
      return sharedModelReponseFromJson(jsonResponse);
    } else {
      return sharedModelReponseFromJson('{"error":true,"status":400,"message":"Problema de conexión"}');
    }
  }

}