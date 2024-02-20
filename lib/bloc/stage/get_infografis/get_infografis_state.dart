part of 'get_infografis_bloc.dart';

abstract class GetInfografisState {}

class GetInfografisInitial extends GetInfografisState {}

class GetInfografisLoading extends GetInfografisState {}

class GetInfografisLoaded extends GetInfografisState {
  InfografisResponseModel data;

  GetInfografisLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetInfografisLoaded && other.data == data;
  }
}

class GetInfografisError extends GetInfografisState {}
