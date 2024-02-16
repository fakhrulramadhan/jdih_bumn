import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/berita_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class BeritaDatasource {
  Future<Either<String, BeritaResponseModel>> getBerita() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/publikasi/news/berita'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(BeritaResponseModel.fromJson(jsonDecode(response.body))));
      return Right(BeritaResponseModel.fromJson(jsonDecode(response.body)));
      //return Right(PeraturanHukumResponseModel.fromRawJson(response.body));
    } else {
      print(response.body);
      print("Server error");
      return const Left('Server Error');
    }
  }
}
