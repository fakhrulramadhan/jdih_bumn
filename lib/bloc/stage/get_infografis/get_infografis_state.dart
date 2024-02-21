part of 'get_infografis_bloc.dart';

abstract class GetInfografisState {}

class GetInfografisInitial extends GetInfografisState {}

class GetInfografisLoading extends GetInfografisState {
  // InfografisResponseModel data;

  // GetInfografisLoading({required this.data});

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is GetInfografisLoading && other.data == data;
  // }
}

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
