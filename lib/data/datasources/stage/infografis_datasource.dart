import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/infografis_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class InfografisDatasource {
  Future<Either<String, InfografisResponseModel>> getInfografis() async {
    final response = await http.get(
        Uri.parse('${Constants.baseUrlStage}/publikasi/grafis/infografis'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");

      print(Right(InfografisResponseModel.fromJson(jsonDecode(response.body))));

      return Right(InfografisResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("server error");

      return Left('Server Error');
    }
  }
}
