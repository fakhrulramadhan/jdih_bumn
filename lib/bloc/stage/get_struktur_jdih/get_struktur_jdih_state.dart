part of 'get_struktur_jdih_bloc.dart';

abstract class GetStrukturJdihState {}

class GetStrukturJdihInitial extends GetStrukturJdihState {}

class GetStrukturJdihLoading extends GetStrukturJdihState {}

class GetStrukturJdihLoaded extends GetStrukturJdihState {
  StrukturResponseModel data;

  GetStrukturJdihLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetStrukturJdihLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class GetStrukturJdihError extends GetStrukturJdihState {}
