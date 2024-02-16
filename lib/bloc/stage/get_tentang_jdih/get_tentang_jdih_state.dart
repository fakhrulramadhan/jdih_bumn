part of 'get_tentang_jdih_bloc.dart';

abstract class GetTentangJdihState {}

class GetTentangJdihInitial extends GetTentangJdihState {}

class GetTentangJdihLoading extends GetTentangJdihState {}

class GetTentangJdihLoaded extends GetTentangJdihState {
  TentangJdihResponseModel data;

  GetTentangJdihLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetTentangJdihLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class GetTentangJdihError extends GetTentangJdihState {}
