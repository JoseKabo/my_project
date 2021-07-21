import 'package:http/http.dart' as http;
import 'package:my_project/core/models/signIn.model.dart';
import 'package:my_project/core/models/signInResponse.model.dart';


class SignInService {

  static var client = http.Client();

  static Future<SignInModelResponse?> signIn(
    {required SignInModel model}
  ) async {
    final data = {
      'email': model.email,
      'password': model.password
    };
    var uriResponse = await client.post(
      Uri.parse('http://192.168.1.67:3000/auth/signin'),
      body: data
    );
    if( uriResponse.statusCode == 200 ){
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
      if(jsonResponse.contains('false'))
        return signInModelResponseFromJson(jsonResponse);
      else
        return null;
    } else {
      return null;
    }
  }

}