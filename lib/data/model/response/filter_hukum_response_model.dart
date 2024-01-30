import 'dart:convert';

//https://jdih.bumn.go.id/api/mobileservice/getdatabyparam
class FilterHukumResponseModel {
  final List<Item>? items;

  FilterHukumResponseModel({
    this.items,
  });

  FilterHukumResponseModel copyWith({
    List<Item>? items,
  }) =>
      FilterHukumResponseModel(
        items: items ?? this.items,
      );

  factory FilterHukumResponseModel.fromRawJson(String str) =>
      FilterHukumResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FilterHukumResponseModel.fromJson(Map<String, dynamic> json) =>
      FilterHukumResponseModel(
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
  final String? id;
  final String? perNo;
  final String? tentang;
  final String? tanggal;
  final String? bentukShort;
  final String? bentuk;
  final int? fileId;
  final String? publishedAt;
  final int? readingCounter;
  final dynamic subjeks;
  final String? tahun;
  final String? abstraksi;
  final String? status;

  Item({
    this.id,
    this.perNo,
    this.tentang,
    this.tanggal,
    this.bentukShort,
    this.bentuk,
    this.fileId,
    this.publishedAt,
    this.readingCounter,
    this.subjeks,
    this.tahun,
    this.abstraksi,
    this.status,
  });

  Item copyWith({
    String? id,
    String? perNo,
    String? tentang,
    String? tanggal,
    String? bentukShort,
    String? bentuk,
    int? fileId,
    String? publishedAt,
    int? readingCounter,
    dynamic subjeks,
    String? tahun,
    String? abstraksi,
    String? status,
  }) =>
      Item(
        id: id ?? this.id,
        perNo: perNo ?? this.perNo,
        tentang: tentang ?? this.tentang,
        tanggal: tanggal ?? this.tanggal,
        bentukShort: bentukShort ?? this.bentukShort,
        bentuk: bentuk ?? this.bentuk,
        fileId: fileId ?? this.fileId,
        publishedAt: publishedAt ?? this.publishedAt,
        readingCounter: readingCounter ?? this.readingCounter,
        subjeks: subjeks ?? this.subjeks,
        tahun: tahun ?? this.tahun,
        abstraksi: abstraksi ?? this.abstraksi,
        status: status ?? this.status,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        perNo: json["per_no"],
        tentang: json["tentang"],
        tanggal: json["tanggal"],
        bentukShort: json["bentuk_short"],
        bentuk: json["bentuk"],
        fileId: json["file_id"],
        publishedAt: json["published_at"],
        readingCounter: json["reading_counter"],
        subjeks: json["subjeks"],
        tahun: json["tahun"],
        abstraksi: json["abstraksi"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "per_no": perNo,
        "tentang": tentang,
        "tanggal": tanggal,
        "bentuk_short": bentukShort,
        "bentuk": bentuk,
        "file_id": fileId,
        "published_at": publishedAt,
        "reading_counter": readingCounter,
        "subjeks": subjeks,
        "tahun": tahun,
        "abstraksi": abstraksi,
        "status": status,
      };
}
