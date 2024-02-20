part of 'get_putusan_bloc.dart';

abstract class GetPutusanState {}

class GetPutusanInital extends GetPutusanState {}

class GetPutusanLoading extends GetPutusanState {}

class GetPutusanLoaded extends GetPutusanState {
  PutusanResponseModel data;

  GetPutusanLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPutusanLoaded && other.data == data;
  }
}

class GetPutusanError extends GetPutusanState {}
