import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_populer_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

class PeraturanPopulerDatasource {
  //PeraturanPopulerResponseModel PeraturanPopulerNewResponseModel
  Future<Either<String, PeraturanPopulerResponseModel>>
      getPeraturanPopuler() async {
    final response = await http.get(Uri.parse(
        '${Constants.baseUrlStage}/homepage/populer/peraturan-populer'));

    if (response.statusCode == 200) {
      print(response.body);
      print("========");
      print(Right(
          PeraturanPopulerResponseModel.fromJson(jsonDecode(response.body))));

      return Right(
          PeraturanPopulerResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      print(response.body);
      print("server error");

      return const Left("Server Error");
    }
  }
}
