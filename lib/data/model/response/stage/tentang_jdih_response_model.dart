// To parse this JSON data, do
//
//     final TentangJdihResponseModel = TentangJdihResponseModelFromJson(jsonString);

import 'dart:convert';

TentangJdihResponseModel TentangJdihResponseModelFromJson(String str) =>
    TentangJdihResponseModel.fromJson(json.decode(str));

String TentangJdihResponseModelToJson(TentangJdihResponseModel data) =>
    json.encode(data.toJson());

class TentangJdihResponseModel {
  final List<Item>? items;

  TentangJdihResponseModel({
    this.items,
  });

  TentangJdihResponseModel copyWith({
    List<Item>? items,
  }) =>
      TentangJdihResponseModel(
        items: items ?? this.items,
      );

  factory TentangJdihResponseModel.fromJson(Map<String, dynamic> json) =>
      TentangJdihResponseModel(
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
  final String? visi;
  final String? misi;

  Item({
    this.id,
    this.judul,
    this.deskripsi,
    this.visi,
    this.misi,
  });

  Item copyWith({
    int? id,
    String? judul,
    String? deskripsi,
    String? visi,
    String? misi,
  }) =>
      Item(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        visi: visi ?? this.visi,
        misi: misi ?? this.misi,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        visi: json["visi"],
        misi: json["misi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "visi": visi,
        "misi": misi,
      };
}
