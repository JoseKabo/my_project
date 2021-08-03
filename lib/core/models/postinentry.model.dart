import 'dart:convert';

AddPostModel addPostModelFromJson(String str) => AddPostModel.fromJson(json.decode(str));

String addPostModelToJson(AddPostModel data) => json.encode(data.toJson());

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