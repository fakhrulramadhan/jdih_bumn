import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart ' as http;

class PeraturanHukumDatasource {
  Future<Either<String, PeraturanHukumResponseModel>> getPeraturan() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrl}/mobileservice/getlastperaturan'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(
          PeraturanHukumResponseModel.fromJson(jsonDecode(response.body))));
      return Right(
          PeraturanHukumResponseModel.fromJson(jsonDecode(response.body)));
      //return Right(PeraturanHukumResponseModel.fromRawJson(response.body));
    } else {
      print(response.body);
      print("Server error");
      return const Left('Server Error');
    }
  }

  // Future<Either<String, Item>> getPeraturan() async {
  //   final response = await http.get(
  //       Uri.parse("${Constants.baseUrl}/mobileservice/getlastperaturan"),
  //       headers: <String, String>{'Content-Type': 'application/json'});

  //   if (response.statusCode == 200) {
  //     return Right(Item.fromJson(jsonDecode(response.body)));
  //   } else {
  //     return const Left('Server Error');
  //   }
  // }
}
