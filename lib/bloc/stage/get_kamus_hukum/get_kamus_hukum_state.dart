part of 'get_kamus_hukum_bloc.dart';

abstract class GetKamusHukumState {}

class GetKamusHukumInitial extends GetKamusHukumState {}

class GetKamusHukumLoading extends GetKamusHukumState {}

class GetKamusHukumLoaded extends GetKamusHukumState {
  KamusHukumResponseModel data;

  GetKamusHukumLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetKamusHukumLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class GetKamusHukumLoadedSplit extends GetKamusHukumState {
  final List<List<Item>> pages;

  GetKamusHukumLoadedSplit({required this.pages});

  @override
  List<Object> get props => [pages];
}

class GetKamusHukumError extends GetKamusHukumState {}
