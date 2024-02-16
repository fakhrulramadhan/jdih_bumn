// To parse this JSON data, do
//
//     final StrukturResponseModel = StrukturResponseModelFromJson(jsonString);

import 'dart:convert';

StrukturResponseModel StrukturResponseModelFromJson(String str) =>
    StrukturResponseModel.fromJson(json.decode(str));

String StrukturResponseModelToJson(StrukturResponseModel data) =>
    json.encode(data.toJson());

class StrukturResponseModel {
  final List<Item>? items;

  StrukturResponseModel({
    this.items,
  });

  StrukturResponseModel copyWith({
    List<Item>? items,
  }) =>
      StrukturResponseModel(
        items: items ?? this.items,
      );

  factory StrukturResponseModel.fromJson(Map<String, dynamic> json) =>
      StrukturResponseModel(
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
  final String? organisasi;
  final String? pengelola;

  Item({
    this.id,
    this.organisasi,
    this.pengelola,
  });

  Item copyWith({
    int? id,
    String? organisasi,
    String? pengelola,
  }) =>
      Item(
        id: id ?? this.id,
        organisasi: organisasi ?? this.organisasi,
        pengelola: pengelola ?? this.pengelola,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        organisasi: json["organisasi"],
        pengelola: json["pengelola"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "organisasi": organisasi,
        "pengelola": pengelola,
      };
}
