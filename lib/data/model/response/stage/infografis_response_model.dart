// To parse this JSON data, do
//
//     final infografisResponseModel = infografisResponseModelFromJson(jsonString);

import 'dart:convert';

InfografisResponseModel infografisResponseModelFromJson(String str) =>
    InfografisResponseModel.fromJson(json.decode(str));

String infografisResponseModelToJson(InfografisResponseModel data) =>
    json.encode(data.toJson());

class InfografisResponseModel {
  final List<Item>? items;

  InfografisResponseModel({
    this.items,
  });

  InfografisResponseModel copyWith({
    List<Item>? items,
  }) =>
      InfografisResponseModel(
        items: items ?? this.items,
      );

  factory InfografisResponseModel.fromJson(Map<String, dynamic> json) =>
      InfografisResponseModel(
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
  final int? order;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? urlDetailInfografis;
  final List<Detail>? details;

  Item({
    this.id,
    this.judul,
    this.order,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.urlDetailInfografis,
    this.details,
  });

  Item copyWith({
    int? id,
    String? judul,
    int? order,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? urlDetailInfografis,
    List<Detail>? details,
  }) =>
      Item(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        order: order ?? this.order,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        urlDetailInfografis: urlDetailInfografis ?? this.urlDetailInfografis,
        details: details ?? this.details,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        judul: json["judul"],
        order: json["order"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        urlDetailInfografis: json["urlDetailInfografis"],
        details: json["details"] == null
            ? []
            : List<Detail>.from(
                json["details"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "order": order,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "urlDetailInfografis": urlDetailInfografis,
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  final String? imagePath;
  final int? orderDetail;

  Detail({
    this.imagePath,
    this.orderDetail,
  });

  Detail copyWith({
    String? imagePath,
    int? orderDetail,
  }) =>
      Detail(
        imagePath: imagePath ?? this.imagePath,
        orderDetail: orderDetail ?? this.orderDetail,
      );

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        imagePath: json["image_path"],
        orderDetail: json["order_detail"],
      );

  Map<String, dynamic> toJson() => {
        "image_path": imagePath,
        "order_detail": orderDetail,
      };
}
