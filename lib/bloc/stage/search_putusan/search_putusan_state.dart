part of 'search_putusan_bloc.dart';

abstract class SearchPutusanState {}

class SearchPutusanInitial extends SearchPutusanState {}

class SearchPutusanLoading extends SearchPutusanState {}

class SearchPutusanLoaded extends SearchPutusanState {
  PutusanResponseModel data;

  SearchPutusanLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchPutusanLoaded && other.data == data;
  }
}

class SearchPutusanError extends SearchPutusanState {}
