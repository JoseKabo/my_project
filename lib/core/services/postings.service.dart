import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/core/models/newpost.model.dart';
import 'package:my_project/core/models/postinentry.model.dart';
import 'package:my_project/core/models/postings.model.dart';
import 'package:my_project/shared/endpoints.dart';
import 'package:my_project/shared/headers.dart';

class PostingServices{
  static var client = http.Client();


  static Future<PostingsResponse?> fetchPostings() async {
    var uriResponse = await client.get(Uri.parse("${Endpoints.prod_endpoint}/home/getAllPosts"), headers: HeadersRequest.requestHeaders);
    if(uriResponse.statusCode == 200) {
      var jsonResponse = uriResponse.body;
      print(jsonResponse);
      return postingsResponseFromJson(jsonResponse);
    }else {
      return null;
    }
  }

  static Future<NewPostReponse?> addNewPost({
    required AddPostModel body
  }) async {
    final uriResponse = await client.post(
      Uri.parse("${Endpoints.prod_endpoint}/postings/newPosting"), 
      body: addPostModelToJson(body),
      headers: HeadersRequest.requestHeaders
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