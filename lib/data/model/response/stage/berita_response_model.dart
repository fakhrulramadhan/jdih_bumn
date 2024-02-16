// To parse this JSON data, do
//
//     final BeritaResponseModel = BeritaResponseModelFromJson(jsonString);

import 'dart:convert';

BeritaResponseModel BeritaResponseModelFromJson(String str) =>
    BeritaResponseModel.fromJson(json.decode(str));

String BeritaResponseModelToJson(BeritaResponseModel data) =>
    json.encode(data.toJson());

class BeritaResponseModel {
  final List<Item>? items;

  BeritaResponseModel({
    this.items,
  });

  BeritaResponseModel copyWith({
    List<Item>? items,
  }) =>
      BeritaResponseModel(
        items: items ?? this.items,
      );

  factory BeritaResponseModel.fromJson(Map<String, dynamic> json) =>
      BeritaResponseModel(
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
  final String? narasiSingkat;
  final String? narasi;
  final String? imagePath;
  final DateTime? tanggal;
  final String? slug;
  final String? imagePathOri;
  final bool? status;
  final String? imagePathFull;
  final String? imagePathOriFull;

  Item({
    this.id,
    this.judul,
    this.narasiSingkat,
    this.narasi,
    this.imagePath,
    this.tanggal,
    this.slug,
    this.imagePathOri,
    this.status,
    this.imagePathFull,
    this.imagePathOriFull,
  });

  Item copyWith({
    int? id,
    String? judul,
    String? narasiSingkat,
    String? narasi,
    String? imagePath,
    DateTime? tanggal,
    String? slug,
    String? imagePathOri,
    bool? status,
    String? imagePathFull,
    String? imagePathOriFull,
  }) =>
      Item(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        narasiSingkat: narasiSingkat ?? this.narasiSingkat,
        narasi: narasi ?? this.narasi,
        imagePath: imagePath ?? this.imagePath,
        tanggal: tanggal ?? this.tanggal,
        slug: slug ?? this.slug,
        imagePathOri: imagePathOri ?? this.imagePathOri,
        status: status ?? this.status,
        imagePathFull: imagePathFull ?? this.imagePathFull,
        imagePathOriFull: imagePathOriFull ?? this.imagePathOriFull,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        judul: json["judul"],
        narasiSingkat: json["narasi_singkat"],
        narasi: json["narasi"],
        imagePath: json["image_path"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        slug: json["slug"],
        imagePathOri: json["image_path_ori"],
        status: json["status"],
        imagePathFull: json["image_path_full"],
        imagePathOriFull: json["image_path_ori_full"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "narasi_singkat": narasiSingkat,
        "narasi": narasi,
        "image_path": imagePath,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "slug": slug,
        "image_path_ori": imagePathOri,
        "status": status,
        "image_path_full": imagePathFull,
        "image_path_ori_full": imagePathOriFull,
      };
}
