import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class PeraturanDatasource {
  Future<Either<String, PeraturanResponseModel>> getPeraturan() async {
    final response = await http.get(
        Uri.parse('${Constants.baseUrlStage}/produk-hukum/produk/peraturan'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(PeraturanResponseModel.fromJson(jsonDecode(response.body))));

      return Right(PeraturanResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);

      return Left("Server Error");
    }
  }
}
