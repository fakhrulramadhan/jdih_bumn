import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class PutusanDatasource {
  Future<Either<String, PutusanResponseModel>> getPutusan() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/produk-hukum/putusan'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(PutusanResponseModel.fromJson(jsonDecode(response.body))));
      return Right(PutusanResponseModel.fromJson(jsonDecode(response.body)));
      //return Right(PeraturanHukumResponseModel.fromRawJson(response.body));
    } else {
      print(response.body);
      print("Server error");
      return const Left('Server Error');
    }
  }
}
