//https://jdih.bumn.go.id/api/mobileservice/getdisclaimerdata
//belum ada datanya
import 'dart:convert';

class GetDisclaimerResponseModel {
  final List<dynamic>? items;

  GetDisclaimerResponseModel({
    this.items,
  });

  GetDisclaimerResponseModel copyWith({
    List<dynamic>? items,
  }) =>
      GetDisclaimerResponseModel(
        items: items ?? this.items,
      );

  factory GetDisclaimerResponseModel.fromRawJson(String str) =>
      GetDisclaimerResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetDisclaimerResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDisclaimerResponseModel(
        items: json["items"] == null
            ? []
            : List<dynamic>.from(json["items"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x)),
      };
}
