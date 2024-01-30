import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/constants/constants.dart';
import '../model/response/produk_hukum_response_model.dart';
import 'package:http/http.dart' as http;

class ProdukHukumDataSource {
  //error type 'List<dynamic>' is not a subtype of type 'Map<String, dynamic>'
  Future<Either<String, List<ProdukHukumResponseModel>>> getJdih() async {
    final response =
        await http.get(Uri.parse("${Constants.baseUrl}/service-to-jdihn"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      print(response.body);
      print("=====");
      // print(Right(ProdukHukumResponseModel.fromRawJson(response.body)));

      List jsonResponse = json.decode(response.body);
      print(jsonResponse
          .map((item) => ProdukHukumResponseModel.fromJson(item))
          .toList());
      return Right(jsonResponse
          .map((item) => ProdukHukumResponseModel.fromJson(item))
          .toList());
    } else {
      print(response.reasonPhrase);
      print("Server error");
      return const Left("Server Error");
    }
  }
}
