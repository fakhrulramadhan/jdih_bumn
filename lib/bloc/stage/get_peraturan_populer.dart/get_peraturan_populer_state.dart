part of 'get_peraturan_populer_bloc.dart';

abstract class GetPeraturanPopulerState {}

class GetPeraturanPopulerStateInitial extends GetPeraturanPopulerState {}

class GetPeraturanPopulerStateLoading extends GetPeraturanPopulerState {}

class GetPeraturanPopulerStateLoaded extends GetPeraturanPopulerState {
  PeraturanPopulerResponseModel data;

  GetPeraturanPopulerStateLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPeraturanPopulerStateLoaded && other.data == data;
  }
}

class GetPeraturanPopulerStateError extends GetPeraturanPopulerState {}
