import 'dart:convert';

NewUserInfoModel newUserInfoModelFromJson(String str) => NewUserInfoModel.fromJson(json.decode(str));

String newUserInfoModelToJson(NewUserInfoModel data) => json.encode(data.toJson());

class NewUserInfoModel {
    NewUserInfoModel({
        this.id,
        this.email,
        this.birthday,
        this.biography
    });

    String? id;
    String? email;
    String? birthday;
    String? biography;

    factory NewUserInfoModel.fromJson(Map<String, dynamic> json) => NewUserInfoModel(
        id: json["id"],
        email: json["email"],
        birthday: json["birthday"],
        biography: json["biography"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "birthday": birthday,
        "biography": biography
    };
}