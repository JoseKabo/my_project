import 'dart:convert';

AddPostModel addPostReponseFromJson(String str) => AddPostModel.fromJson(json.decode(str));

String addPostReponseToJson(AddPostModel data) => json.encode(data.toJson());

class AddPostModel {
    AddPostModel({
        this.description,
        this.idUser
    });

    String? description;
    String? idUser;

    factory AddPostModel.fromJson(Map<String, dynamic> json) => AddPostModel(
        description: json["description"],
        idUser: json["idUser"]
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "idUser": idUser
    };
}