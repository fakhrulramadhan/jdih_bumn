// To parse this JSON data, do
//
//     final KamusHukumResponseModel = KamusHukumResponseModelFromJson(jsonString);

import 'dart:convert';

KamusHukumResponseModel KamusHukumResponseModelFromJson(String str) =>
    KamusHukumResponseModel.fromJson(json.decode(str));

String KamusHukumResponseModelToJson(KamusHukumResponseModel data) =>
    json.encode(data.toJson());

class KamusHukumResponseModel {
  final List<Item>? items;

  KamusHukumResponseModel({
    this.items,
  });

  KamusHukumResponseModel copyWith({
    List<Item>? items,
  }) =>
      KamusHukumResponseModel(
        items: items ?? this.items,
      );

  factory KamusHukumResponseModel.fromJson(Map<String, dynamic> json) =>
      KamusHukumResponseModel(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final int? id;
  final String? istilah;
  final String? definisi;
  final bool? status;

  Item({
    this.id,
    this.istilah,
    this.definisi,
    this.status,
  });

  Item copyWith({
    int? id,
    String? istilah,
    String? definisi,
    bool? status,
  }) =>
      Item(
        id: id ?? this.id,
        istilah: istilah ?? this.istilah,
        definisi: definisi ?? this.definisi,
        status: status ?? this.status,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        istilah: json["istilah"],
        definisi: json["definisi"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "istilah": istilah,
        "definisi": definisi,
        "status": status,
      };
}
