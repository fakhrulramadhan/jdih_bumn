part of 'get_faq_bloc.dart';

abstract class GetFaqState {}

class GetFaqInitial extends GetFaqState {}

class GetFaqLoading extends GetFaqState {}

class GetFaqLoaded extends GetFaqState {
  FaqResponseModel data;

  GetFaqLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetFaqLoaded && other.data == data;
  }
}

class GetFaqError extends GetFaqState {}
