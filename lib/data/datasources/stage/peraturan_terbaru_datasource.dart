import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbaru_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbarus_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class PeraturanTerbaruDatasource {
  Future<Either<String, PeraturanTerbaruResponseModel>>
      getPeraturanTerbaru() async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/homepage/terbaru/peraturan-terbaru'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(
          PeraturanTerbaruResponseModel.fromJson(jsonDecode(response.body))));

      return Right(
          PeraturanTerbaruResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);

      return const Left("Server Error");
    }
  }

  Future<Either<String, PeraturanTerbarusResponseModel>>
      getPeraturanTerbarus() async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/homepage/terbaru/peraturan-terbaru'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(
          PeraturanTerbarusResponseModel.fromJson(jsonDecode(response.body))));

      return Right(
          PeraturanTerbarusResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);

      return const Left("Server Error");
    }
  }
}
