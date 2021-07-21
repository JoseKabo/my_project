import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/core/models/newuserInfo.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/core/models/updateinfo.model.dart';

class ProfileService {
  static var client = http.Client();

  static Future<PostingsResponse?> fetchMyPostings({
    required String id
  }) async {
    final data = {
      'id': id
    };
    var uriResponse = await client.post(
      Uri.parse('http://192.168.1.67:3000/profile/myposts'),
      body: data
    );
    if(uriResponse.statusCode == 200) {
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
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
      Uri.parse('http://192.168.1.67:3000/profile/changeInfo'),
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
      Uri.parse('http://192.168.1.67:3000/profile/mybasicinfo'),
      body: data
    );
    if(uriResponse.statusCode == 200){
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
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
      Uri.parse('http://192.168.1.67:3000/profile/mystadistics'),
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