import 'dart:convert';
import 'package:dartz/dartz.dart';
//import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturans_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/search_peraturan_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class PeraturanDatasource {
  Future<Either<String, PeraturansResponseModel>> getPeraturan() async {
    final response = await http.get(
        Uri.parse('${Constants.baseUrlStage}/produk-hukum/produk/peraturan'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(PeraturansResponseModel.fromJson(jsonDecode(response.body))));

      return Right(PeraturansResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);

      return const Left("Server Error");
    }
  }

  // Future<Either<String, PeraturanResponseModel>> getPeraturanPaging(
  //     {required int page}) async {
  //   final response = await http.get(Uri.parse(
  //       '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$page'));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print("=====");
  //     print(Right(PeraturanResponseModel.fromJson(jsonDecode(response.body))));

  //     return Right(PeraturanResponseModel.fromJson(jsonDecode(response.body)));
  //   } else {
  //     print(response.body);

  //     return const Left("Server Error");
  //   }
  // }

  // Future<Either<String, PeraturanResponseModel>> getPeraturanSearch(
  //     {String? judul, String? nomor_peraturan_baru}) async {
  //   final response = await http.get(Uri.parse(
  //       '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$page'));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print("=====");
  //     print(Right(PeraturanResponseModel.fromJson(jsonDecode(response.body))));

  //     return Right(PeraturanResponseModel.fromJson(jsonDecode(response.body)));
  //   } else {
  //     print(response.body);

  //     return const Left("Server Error");
  //   }
  // }

  // Future<PeraturanResponseModel> getPeraturanPaging({required int page}) async {
  //   final response = await http.get(Uri.parse(
  //       '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$page'));

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print("=====");
  //     print(Right(PeraturanResponseModel.fromJson(jsonDecode(response.body))));

  //     return PeraturanResponseModel.fromJson(json.decode(response.body));
  //   } else {
  //     print(response.body);

  //     throw Exception('Failed to Load Data');
  //   }
  // }

  Future<List<Item>> getDataPaging({required int page}) async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$page'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<Item> dataList = (jsonData['items'] as List)
          .map((data) => Item.fromJson(data))
          .toList();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<Either<String, PeraturanResponseModel>> getSearchPeraturan(
  //     String keyword,
  //     {int? page}) async {
  //   final response = await http.get(Uri.parse(
  //       '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$page&keyword=$keyword'));

  //   if (response.statusCode == 200) {
  //     return Right(PeraturanResponseModel.fromJson(jsonDecode(response.body)));
  //     // final jsonData = jsonDecode(response.body);
  //     // final List<Item> dataList = (jsonData['items'] as List)
  //     //     .map((data) => Item.fromJson(data))
  //     //     .toList();
  //     // return dataList;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future<List<PeraturanSearch>> postSearchPeraturan(
      {required String keyword}) async {
    final response = await http.post(
        Uri.parse(
            '${Constants.baseUrlStage}/produk-hukum/search/searchPeraturan'),
        body: {"keyword": keyword});

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<PeraturanSearch> dataList = (jsonData['items'] as List)
          .map((data) => PeraturanSearch.fromJson(data))
          .toList();
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchPeraturan(int page) async {
    try {
      final response = await http.get(Uri.parse(
          '${Constants.baseUrlStage}/produk-hukum/produk/peraturan?page=$page'));

      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      return [];
    }
  }
}
