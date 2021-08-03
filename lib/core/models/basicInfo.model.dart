
import 'dart:convert';

BasicInfoResponse basicInfoResponseFromJson(String str) => BasicInfoResponse.fromJson(json.decode(str));

String basicInfoResponseToJson(BasicInfoResponse data) => json.encode(data.toJson());

String sharedIdModelToJson(SharedId data) => json.encode(data.toJson());
class SharedId {
  SharedId({
    this.id,
  });
  String? id;

  Map<String, dynamic> toJson() => {
    "id": id
  };
}

class BasicInfoResponse {
    BasicInfoResponse({
        this.error,
        this.status,
        this.message,
    });

    bool? error;
    int? status;
    Message? message;

    factory BasicInfoResponse.fromJson(Map<String, dynamic> json) => BasicInfoResponse(
        error: json["error"],
        status: json["status"],
        message: Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "status": status,
        "message": message!.toJson(),
    };
}

class Message {
    Message({
        this.response,
        this.message,
    });

    List<BasicInfoModel>? response;
    String? message;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        response: List<BasicInfoModel>.from(json["response"].map((x) => BasicInfoModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response!.map((x) => x.toJson())),
        "message": message,
    };
}

class BasicInfoModel {
    BasicInfoModel({
        this.name,
        this.username,
        this.email,
        this.birthday,
        this.biography,
    });

    String? name;
    String? username;
    String? email;
    String? birthday;
    String? biography;

    factory BasicInfoModel.fromJson(Map<String, dynamic> json) => BasicInfoModel(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        birthday: json["birthday"],
        biography: json["biography"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "birthday": birthday,
        "biography": biography,
    };
}
