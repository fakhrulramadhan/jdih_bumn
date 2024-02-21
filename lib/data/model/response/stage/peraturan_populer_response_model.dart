// To parse this JSON data, do
//
//     final peraturanPopulerResponseModel = peraturanPopulerResponseModelFromJson(jsonString);

import 'dart:convert';

PeraturanPopulerResponseModel peraturanPopulerResponseModelFromJson(
        String str) =>
    PeraturanPopulerResponseModel.fromJson(json.decode(str));

String peraturanPopulerResponseModelToJson(
        PeraturanPopulerResponseModel data) =>
    json.encode(data.toJson());

class PeraturanPopulerResponseModel {
  final List<Item>? items;

  PeraturanPopulerResponseModel({
    this.items,
  });

  PeraturanPopulerResponseModel copyWith({
    List<Item>? items,
  }) =>
      PeraturanPopulerResponseModel(
        items: items ?? this.items,
      );

  factory PeraturanPopulerResponseModel.fromJson(Map<String, dynamic> json) =>
      PeraturanPopulerResponseModel(
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
  final String? jenisPeraturanShort;
  final String? nomorPeraturanBaru;
  final String? deskripsiTentang;
  final String? tglPenetapanMigrasi;
  final String? slug;
  final bool? isPublish;
  final int? countReader;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? seeData;

  Item({
    this.id,
    this.jenisPeraturanShort,
    this.nomorPeraturanBaru,
    this.deskripsiTentang,
    this.tglPenetapanMigrasi,
    this.slug,
    this.isPublish,
    this.countReader,
    this.createdAt,
    this.updatedAt,
    this.seeData,
  });

  Item copyWith({
    int? id,
    String? jenisPeraturanShort,
    String? nomorPeraturanBaru,
    String? deskripsiTentang,
    String? tglPenetapanMigrasi,
    String? slug,
    bool? isPublish,
    int? countReader,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? seeData,
  }) =>
      Item(
        id: id ?? this.id,
        jenisPeraturanShort: jenisPeraturanShort ?? this.jenisPeraturanShort,
        nomorPeraturanBaru: nomorPeraturanBaru ?? this.nomorPeraturanBaru,
        deskripsiTentang: deskripsiTentang ?? this.deskripsiTentang,
        tglPenetapanMigrasi: tglPenetapanMigrasi ?? this.tglPenetapanMigrasi,
        slug: slug ?? this.slug,
        isPublish: isPublish ?? this.isPublish,
        countReader: countReader ?? this.countReader,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        seeData: seeData ?? this.seeData,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        jenisPeraturanShort: json["jenis_peraturan_short"],
        nomorPeraturanBaru: json["nomor_peraturan_baru"],
        deskripsiTentang: json["deskripsi_tentang"],
        tglPenetapanMigrasi: json["tgl_penetapan_migrasi"],
        slug: json["slug"],
        isPublish: json["is_publish"],
        countReader: json["count_reader"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        seeData: json["see_data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_peraturan_short": jenisPeraturanShort,
        "nomor_peraturan_baru": nomorPeraturanBaru,
        "deskripsi_tentang": deskripsiTentang,
        "tgl_penetapan_migrasi": tglPenetapanMigrasi,
        "slug": slug,
        "is_publish": isPublish,
        "count_reader": countReader,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "see_data": seeData,
      };
}
