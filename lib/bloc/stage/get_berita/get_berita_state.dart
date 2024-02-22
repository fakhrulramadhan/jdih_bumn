part of 'get_berita_bloc.dart';

abstract class GetBeritaState {}

class GetBeritaInital extends GetBeritaState {}

class GetBeritaLoading extends GetBeritaState {}

class GetBeritaLoaded extends GetBeritaState {
  BeritaResponseModel data;

  GetBeritaLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetBeritaLoaded && other.data == data;
  }
}

class GetBeritaSort extends GetBeritaState {
  List<dynamic> data; //ambil items nya aja
  //BeritaResponseModel data;

  GetBeritaSort({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetBeritaSort && other.data == data;
  }
}

class GetBeritaError extends GetBeritaState {}
