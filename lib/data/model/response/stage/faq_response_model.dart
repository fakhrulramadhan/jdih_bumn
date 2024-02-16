// To parse this JSON data, do
//
//     final FaqResponseModel = FaqResponseModelFromJson(jsonString);

import 'dart:convert';

FaqResponseModel FaqResponseModelFromJson(String str) =>
    FaqResponseModel.fromJson(json.decode(str));

String FaqResponseModelToJson(FaqResponseModel data) =>
    json.encode(data.toJson());

class FaqResponseModel {
  final List<Item>? items;

  FaqResponseModel({
    this.items,
  });

  FaqResponseModel copyWith({
    List<Item>? items,
  }) =>
      FaqResponseModel(
        items: items ?? this.items,
      );

  factory FaqResponseModel.fromJson(Map<String, dynamic> json) =>
      FaqResponseModel(
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
  final String? question;
  final String? answer;
  final bool? status;

  Item({
    this.id,
    this.question,
    this.answer,
    this.status,
  });

  Item copyWith({
    int? id,
    String? question,
    String? answer,
    bool? status,
  }) =>
      Item(
        id: id ?? this.id,
        question: question ?? this.question,
        answer: answer ?? this.answer,
        status: status ?? this.status,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "status": status,
      };
}
