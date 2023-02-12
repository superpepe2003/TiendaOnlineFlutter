import 'dart:convert';

List<MenuModel> menuFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  MenuModel({
    this.icon,
    this.name,
    this.redirectTo,
  });

  String icon;
  String name;
  String redirectTo;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        icon: json["icon"],
        name: json["name"] ?? '',
        redirectTo: json["redirectTo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
        "redirectTo": redirectTo,
      };
}
