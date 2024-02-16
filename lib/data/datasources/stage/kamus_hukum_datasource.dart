import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/kamus_hukum_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class KamusHukumDatasource {
  Future<Either<String, KamusHukumResponseModel>> getKamusHukum() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/publikasi/kamus-hukum'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body))));
      return Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("Server Error");
      return Left('Server Error');
    }
  }
}
