// /profil/strukturJDIH/struktur
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/struktur_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class StrukturJdihDatasource {
  //future dieksekusinya nanti
  Future<Either<String, StrukturResponseModel>> getStruktur() async {
    final response = await http.get(
        Uri.parse('${Constants.baseUrlStage}/profil/strukturJDIH/struktur'));

    if (response.statusCode == 200) {
      print(response.body);
      print("Ini Response Struktur");
      print(Right(StrukturResponseModel.fromJson(jsonDecode(response.body))));
      return Right(StrukturResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("server error");
      return Left("Server Error");
    }
  }
}
