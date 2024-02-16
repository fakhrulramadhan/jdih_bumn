part of 'get_filter_hukum_bloc.dart';

abstract class GetFilterHukumState {}

class GetFilterHukumInitial extends GetFilterHukumState {}

class GetFilterHukumLoading extends GetFilterHukumState {}

class GetFilterHukumLoaded extends GetFilterHukumState {
  FilterHukumResponseModel data;

  GetFilterHukumLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetFilterHukumLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class GetFilterHukumError extends GetFilterHukumState {}
