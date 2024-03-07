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
      return const Left('Server Error');
    }
  }

  Future<Either<String, KamusHukumResponseModel>> getKamusHukumPage(
      int pageNumber,
      {int? page}) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/publikasi/kamus-hukum?page=$page'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body))));
      return Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("Server Error");
      return const Left('Server Error');
    }
  }

  Future<Either<String, KamusHukumResponseModel>> getKamusHukumPageKeyword(
      String keyword,
      {int? page}) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/publikasi/kamus-hukum?page=$page&keyword=$keyword'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body))));
      return Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("Server Error");
      return const Left('Server Error');
    }
  }

  Future<List<Item>> getKamusHukumFetchPage(int pageNumber) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/publikasi/kamus-hukum?page=$pageNumber'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Item.fromJson(data)).toList();

      //return KamusHukumResponseModelFromJson(response.body);
    } else {
      throw Exception('Failed to load items');
    }
  }

  //  Future<Either<String, List<Item>>> getKamusList() async {
  //   final response = await http
  //       .get(Uri.parse('${Constants.baseUrlStage}/publikasi/kamus-hukum'));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print("=====");
  //     print(Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body))));
  //     return Right(KamusHukumResponseModel.fromJson(jsonDecode(response.body)));
  //   } else {
  //     print(response.body);
  //     print("Server Error");
  //     return const Left('Server Error');
  //   }
  // }
}
