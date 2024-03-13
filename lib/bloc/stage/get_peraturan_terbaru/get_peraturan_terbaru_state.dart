part of 'get_peraturan_terbaru_bloc.dart';

abstract class GetPeraturanTerbaruState {}

class GetPeraturanTerbaruInitial extends GetPeraturanTerbaruState {}

class GetPeraturanTerbaruLoading extends GetPeraturanTerbaruState {}

class GetPeraturanTerbaruLoaded extends GetPeraturanTerbaruState {
  //PeraturanTerbaruResponseModel data;
  PeraturanTerbarusResponseModel data;

  GetPeraturanTerbaruLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPeraturanTerbaruLoaded && other.data == data;
  }
}

class GetPeraturanTerbaruError extends GetPeraturanTerbaruState {}
