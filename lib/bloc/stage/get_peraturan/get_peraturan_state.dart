part of 'get_peraturan_bloc.dart';

abstract class GetPeraturanState {}

class GetPeraturanInitial extends GetPeraturanState {}

class GetPeraturanLoading extends GetPeraturanState {}

class GetPeraturanLoaded extends GetPeraturanState {
  PeraturansResponseModel data;

  GetPeraturanLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPeraturanLoaded && other.data == data;
  }
}

class GetPeraturanError extends GetPeraturanState {}
