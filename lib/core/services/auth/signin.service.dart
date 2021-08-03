import 'package:http/http.dart' as http;
import 'package:my_project/core/models/signIn.model.dart';
import 'package:my_project/core/models/signInResponse.model.dart';
import 'package:my_project/shared/endpoints.dart';
import 'package:my_project/shared/headers.dart';


class SignInService {

  static var client = http.Client();

  static Future<SignInModelResponse?> signIn(
    {required SignInModel model}
  ) async {
    var uriResponse = await client.post(
      Uri.parse("${Endpoints.prod_endpoint}/auth/signin".toString()),
      body: signInModelToJson(model),
      headers: HeadersRequest.requestHeaders
    );
    if( uriResponse.statusCode == 200 ){
      var jsonResponse = uriResponse.body;
      if(jsonResponse.contains('false'))
        return signInModelResponseFromJson(jsonResponse);
      else
        return null;
    } else {
      return null;
    }
  }
}