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

class GetBeritaError extends GetBeritaState {}
