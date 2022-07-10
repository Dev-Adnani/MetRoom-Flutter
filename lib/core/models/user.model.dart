import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        required this.createdAt,
        required this.userName,
        required this.userEmail,
        required this.userPassword,
        required this.userPhoneNo,
         this.userProfileUrl,
    });

    String? createdAt;
    String userName;
    String userEmail;
    String userPassword;
    String userPhoneNo;
    String? userProfileUrl;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json["created_at"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userPhoneNo: json["user_phone_no"],
        userProfileUrl: json["user_profile_url"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "user_name": userName,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_phone_no": userPhoneNo,
        "user_profile_url": userProfileUrl,
    };
}
