import 'package:http/http.dart' as http;
import 'package:my_project/core/models/SingUpResponse.model.dart';
import 'package:my_project/core/models/signUp.mode.dart';
import 'package:my_project/shared/endpoints.dart';
import 'package:my_project/shared/headers.dart';


class SignUpService {
  static var client = http.Client();

  static Future<SharedModelReponse> signUp(
    {required SignUpModel model}
  ) async {
    var uriResponse = await client.post(
      Uri.parse("${Endpoints.prod_endpoint}/auth/signup"),
      body: signUpModelToJson(model),
      headers: HeadersRequest.requestHeaders
    );
    if( uriResponse.statusCode == 200 ){
      var jsonResponse = uriResponse.body;
      return sharedModelReponseFromJson(jsonResponse);
    } else {
      return sharedModelReponseFromJson('{"error":true,"status":400,"message":"Problema de conexión"}');
    }
  }

}