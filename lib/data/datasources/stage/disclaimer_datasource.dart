import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/disclaimer_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class DisclaimerDatasource {
  Future<Either<String, DisclaimerResponseModel>> getDisclaimer() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/homepage/disclaimer'));

    if (response.statusCode == 200) {
      print(response.body);
      print("======");
      print(Right(DisclaimerResponseModel.fromJson(jsonDecode(response.body))));
      return Right(DisclaimerResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("Server Error");
      return Left("Server Error");
    }
  }
}
