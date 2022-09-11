import 'dart:convert';

EndUser endUserFromJson(String str) => EndUser.fromJson(json.decode(str));

String endUserToJson(EndUser data) => json.encode(data.toJson());

class EndUser {
  EndUser({
    required this.uid,
    this.email,
    this.fullname,
    this.phone,
    this.avatar_url,
    this.about,
  });

  String uid;
  String? email;
  String? fullname;
  String? phone;
  String? avatar_url;
  String? about;

  factory EndUser.fromJson(Map<String, dynamic> json) => EndUser(
    uid: json["uid"],
    email: json["email"],
    fullname: json["fullname"],
    phone: json["phone"],
    avatar_url: json["avatar_url"],
    about: json["about"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "fullname": fullname,
    "phone": phone,
    "avatar_url": avatar_url,
    "about": about,
  };
}
