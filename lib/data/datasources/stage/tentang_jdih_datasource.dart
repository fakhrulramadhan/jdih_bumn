import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/tentang_jdih_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class TentangJdihDatasource {
  Future<Either<String, TentangJdihResponseModel>> getTentangJdih() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/profil/tentang-jdih'));

    if (response.statusCode == 200) {
      print(response.body);
      print("ini response tentang");
      print(
          Right(TentangJdihResponseModel.fromJson(jsonDecode(response.body))));
      return Right(
          TentangJdihResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("Server Error");
      return Left("Server Error");
    }
  }
}
