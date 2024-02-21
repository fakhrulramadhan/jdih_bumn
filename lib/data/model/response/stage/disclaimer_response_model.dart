// To parse this JSON data, do
//
//     final disclaimerResponseModel = disclaimerResponseModelFromJson(jsonString);

import 'dart:convert';

DisclaimerResponseModel disclaimerResponseModelFromJson(String str) =>
    DisclaimerResponseModel.fromJson(json.decode(str));

String disclaimerResponseModelToJson(DisclaimerResponseModel data) =>
    json.encode(data.toJson());

class DisclaimerResponseModel {
  final List<Item>? items;

  DisclaimerResponseModel({
    this.items,
  });

  DisclaimerResponseModel copyWith({
    List<Item>? items,
  }) =>
      DisclaimerResponseModel(
        items: items ?? this.items,
      );

  factory DisclaimerResponseModel.fromJson(Map<String, dynamic> json) =>
      DisclaimerResponseModel(
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
  final String? judul;
  final String? deskripsi;
  final bool? status;

  Item({
    this.id,
    this.judul,
    this.deskripsi,
    this.status,
  });

  Item copyWith({
    int? id,
    String? judul,
    String? deskripsi,
    bool? status,
  }) =>
      Item(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        status: status ?? this.status,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "status": status,
      };
}
