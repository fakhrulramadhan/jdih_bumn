import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/constants/constants.dart';
import '../model/response/filter_hukum_response_model.dart';
import 'package:http/http.dart' as http;

class FilterHukumDatasource {
  Future<Either<String, FilterHukumResponseModel>> getJdih() async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/mobileservice/getdatabyparam'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
      },
    );

    if (response.statusCode == 200) {
      return Right(
          FilterHukumResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, FilterHukumResponseModel>> getFilter(
      String name) async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/mobileservice/$name'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
      },
    );

    if (response.statusCode == 200) {
      return Right(
          FilterHukumResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, FilterHukumResponseModel>> getDataByParam() async {
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}/mobileservice/getdatabyparam'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
      },
    );

    if (response.statusCode == 200) {
      return Right(
          FilterHukumResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('server error');
    }
  }
}
