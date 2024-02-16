import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:jdih_bumn/data/model/response/stage/faq_response_model.dart';
import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

// /profil/qna/faq

//disclaimer revisi ui 3/4 width
//gambar 1/4 width
class FaqDatasource {
  Future<Either<String, FaqResponseModel>> getFaq() async {
    final response =
        await http.get(Uri.parse('${Constants.baseUrlStage}/profil/qna/faq'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(FaqResponseModel.fromJson(jsonDecode(response.body))));
      return Right(FaqResponseModel.fromJson(jsonDecode(response.body)));
      //return Right(PeraturanHukumResponseModel.fromRawJson(response.body));
    } else {
      print(response.body);
      print("Server error");
      return const Left('Server Error');
    }
  }
}
