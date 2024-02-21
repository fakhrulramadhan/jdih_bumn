part of 'get_disclaimer_bloc.dart';

abstract class GetDisclaimerState {}

class GetDisclaimerInitial extends GetDisclaimerState {}

class GetDisclaimerLoading extends GetDisclaimerState {}

class GetDisclaimerLoaded extends GetDisclaimerState {
  DisclaimerResponseModel data;

  GetDisclaimerLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetDisclaimerLoaded && other.data == data;
  }
}

class GetDisclaimerError extends GetDisclaimerState {}
