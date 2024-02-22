// To parse this JSON data, do
//
//     final beritaBaruResponseModel = beritaBaruResponseModelFromJson(jsonString);

import 'dart:convert';

BeritaBaruResponseModel beritaBaruResponseModelFromJson(String str) =>
    BeritaBaruResponseModel.fromJson(json.decode(str));

String beritaBaruResponseModelToJson(BeritaBaruResponseModel data) =>
    json.encode(data.toJson());

class BeritaBaruResponseModel {
  final List<Item>? items;

  BeritaBaruResponseModel({
    this.items,
  });

  BeritaBaruResponseModel copyWith({
    List<Item>? items,
  }) =>
      BeritaBaruResponseModel(
        items: items ?? this.items,
      );

  factory BeritaBaruResponseModel.fromJson(Map<String, dynamic> json) =>
      BeritaBaruResponseModel(
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
  final String? urlDetailBerita;
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
    this.urlDetailBerita,
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
    String? urlDetailBerita,
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
        urlDetailBerita: urlDetailBerita ?? this.urlDetailBerita,
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
        urlDetailBerita: json["urlDetailBerita"],
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
        "urlDetailBerita": urlDetailBerita,
        "image_path_full": imagePathFull,
        "image_path_ori_full": imagePathOriFull,
      };
}
