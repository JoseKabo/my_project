import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/core/models/newuserInfo.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/core/models/updateinfo.model.dart';
import 'package:my_project/shared/endpoints.dart';

class ProfileService {
  static var client = http.Client();

  static Future<PostingsResponse?> fetchMyPostings({
    required String id
  }) async {
    final data = {
      'id': id
    };
    var uriResponse = await client.post(
      Uri.parse("${Endpoints.dev_external}/profile/myposts"),
      body: data
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
    NewUserInfoModel? newuserInfo
  }) async {
    final data = {
      "id": newuserInfo!.id,
      "email": newuserInfo.email,
      "birthday": newuserInfo.birthday,
      "biography": newuserInfo.biography
    };

    var uriResponse = await client.post(
      Uri.parse("${Endpoints.dev_external}/profile/changeInfo"),
      body: data
    );

    if (uriResponse.statusCode != 200)
      return null;
    
    var jsonReponse =uriResponse.body;
    return updateInfoResponseFromJson(jsonReponse);

  }

  static Future<BasicInfoResponse?> getMyBasicInfo({
    required String id
  }) async {
    final data = {
      'id': id
    };
    var uriResponse = await client.post(
      Uri.parse('${Endpoints.dev_external}/profile/mybasicinfo'),
      body: data
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
      Uri.parse('${Endpoints.dev_external}/profile/mystadistics'),
      body: data
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