import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_project/core/models/newpost.model.dart';
import 'package:my_project/core/models/postinentry.model.dart';
import 'package:my_project/core/models/postings.model.dart';

class PostingServices{
  static var client = http.Client();


  static Future<PostingsResponse?> fetchPostings() async {
    var uriResponse = await client.get(Uri.parse('http://192.168.1.67:3000/home/getAllPosts'));
    if(uriResponse.statusCode == 200) {
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
      return postingsResponseFromJson(jsonResponse);
    }else {
      return null;
    }
  }

  static Future<NewPostReponse?> addNewPost({
    AddPostModel? body
  }) async {
    var data = {
      'description': body!.description,
      'idUser': body.idUser
    };
    final uriResponse = await client.post(
      Uri.parse('http://192.168.1.67:3000/postings/newPosting'), 
      body: data
    );
    if(uriResponse.statusCode == 200 && body != null) {
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
      return newPostReponseFromJson(jsonResponse);
    }else {
      return null;
    }
  }

}