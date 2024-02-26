import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

  Future<Either<String, List<dynamic>>> sortBerita() async {
    final response = await http
        .get(Uri.parse('${Constants.baseUrlStage}/publikasi/news/berita'));

    if (response.statusCode == 200) {
      print(response.body);
      print("=====");
      print(Right(BeritaResponseModel.fromJson(jsonDecode(response.body))));

      List<dynamic> responseJson = json.decode(response.body);

      //Map<String, dynamic> data = jsonDecode(response.body);

      // List<Map<String, dynamic>> rows =
      //     List<Map<String, dynamic>>.from(data['items']);

      var beritaList = responseJson.map((e) => Item.fromJson(e)).toList();

      beritaList.sort(
        (a, b) {
          return b.tanggal!.compareTo(a.tanggal!);
        },
      );

      //rows.sort((a, b) => DateTime.parse(formattedString),);

      return Right(beritaList);
      //return Right(PeraturanHukumResponseModel.fromRawJson(response.body));
    } else {
      print(response.body);
      print("Server error");
      return const Left('Server Error');
    }
  }

  Future<Either<String, List<Item>>> fetchsortBerita() async {
    final Dio dio = Dio();
    // final response = await http
    //     .get(Uri.parse('${Constants.baseUrlStage}/publikasi/news/berita'));

    final response =
        await dio.get('${Constants.baseUrlStage}/publikasi/news/berita');

    if (response.statusCode == 200) {
      //List<dynamic> responseJson = json.decode(response.body);
      // List<Item> beritaList =
      //     response.dat.map((e) => new Item.fromJson(e)).toList();

      BeritaResponseModel Berita =
          response.data.map((e) => BeritaResponseModel.fromJson(e));

      List<Item> sortBerita = Berita.items!;

      //membandingkan tanggal terakhir
      sortBerita.sort(
        (a, b) {
          //pastikan tipe datanya datetime
          DateTime tanggalA = a.tanggal!;
          DateTime tanggalB = b.tanggal!;

          //bandingkan tanggal terakhir
          print("berita sort");
          print(tanggalA.compareTo(tanggalB));
          return tanggalA.compareTo(tanggalB);

          // print(a.tanggal!.compareTo(b.tanggal!));
          // return a.tanggal!.compareTo(b.tanggal!);
        },
      );

      print(Right(sortBerita));

      return Right(sortBerita);
      //List<Item> sortBerita = response.data.map((e) => Item.fromJson(e));

      // sortBerita.sort(
      //   (a, b) {
      //     // DateTime dateA = DateTime.parse(a.tanggal.toString());
      //     // DateTime dateB = DateTime.parse(b as String);

      //     return a.tanggal!.compareTo(b.tanggal!);
      //   },
      // );
      // return Right(PeraturanHukumResponseModel.fromRawJson(response.body));
    } else {
      print(response.data);
      print("Server error");
      return const Left('Server Error');
    }
  }
}
