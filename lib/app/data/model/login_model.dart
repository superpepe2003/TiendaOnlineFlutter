import 'dart:convert';

import 'package:tienda_online_flutter/app/data/model/user_model.dart';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.ok,
        this.user,
        this.accessToken,
    });

    bool ok;
    UsuarioModel user;
    String accessToken;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        ok: json["ok"],
        user: UsuarioModel.fromJson(json["user"]),
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "user": user.toJson(),
        "access_token": accessToken,
    };
}
