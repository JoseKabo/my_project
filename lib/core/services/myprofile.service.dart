import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/core/models/SingUpResponse.model.dart';
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/core/models/newuserInfo.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/core/models/updatePassword.model.dart';
import 'package:my_project/core/models/updateinfo.model.dart';
import 'package:my_project/shared/endpoints.dart';
import 'package:my_project/shared/headers.dart';

class ProfileService {
  static var client = http.Client();

  static Future<PostingsResponse?> fetchMyPostings({
    required SharedId id
  }) async {
    var uriResponse = await client.post(
      Uri.parse("${Endpoints.prod_endpoint}/profile/myposts"),
      body: sharedIdModelToJson(id),
      headers: HeadersRequest.requestHeaders
    );
    if(uriResponse.statusCode == 200) {
      var jsonResponse = uriResponse.body;
      // print(jsonResponse);
      return postingsResponseFromJson(jsonResponse);
    }else {
      return null;
    }
  }

  static Future<UpdateInfoResponse?> updateInfo({
    required NewUserInfoModel newuserInfo
  }) async {

    var uriResponse = await client.post(
      Uri.parse("${Endpoints.prod_endpoint}/profile/changeInfo"),
      body: newUserInfoModelToJson(newuserInfo),
      headers: HeadersRequest.requestHeaders
    );

    if (uriResponse.statusCode != 200)
      return null;
    
    var jsonReponse =uriResponse.body;
    return updateInfoResponseFromJson(jsonReponse);

  }

  static Future<SharedModelReponse?> updatePassword({
    required UpdatePassword model
  }) async {

    var uriResponse = await client.post(
      Uri.parse("${Endpoints.prod_endpoint}/profile/changePass"),
      body: updatePasswordToJson(model),
      headers: HeadersRequest.requestHeaders
    );

    if (uriResponse.statusCode != 200)
      return null;
    
    var jsonReponse =uriResponse.body;
    return sharedModelReponseFromJson(jsonReponse);

  }

  static Future<BasicInfoResponse?> getMyBasicInfo({
    required String id
  }) async {
    final data = {
      'id': id
    };
    var uriResponse = await client.post(
      Uri.parse('${Endpoints.prod_endpoint}/profile/mybasicinfo'),
      body: data,
      headers: HeadersRequest.requestHeaders
    );
    if(uriResponse.statusCode == 200){
      var jsonResponse = uriResponse.body;
      // print(jsonResponse);
      return basicInfoResponseFromJson(jsonResponse);
    } else {
      return null;
    }
  }

  static Future<StadisticsResponse?> getMyStadistics({
    required String id
  }) async {
    final data = {
      'id': id
    };
    var uriResponse = await client.post(
      Uri.parse('${Endpoints.prod_endpoint}/profile/mystadistics'),
      body: data,
      headers: HeadersRequest.requestHeaders
    );
    if(uriResponse.statusCode == 200){
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
      return stadisticsResponseFromJson(jsonResponse);
    } else {
      return null;
    }
  }

}