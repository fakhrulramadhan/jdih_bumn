part of 'search_peraturan_bloc.dart';

abstract class SearchPeraturanState {}

class SearchPeraturanInital extends SearchPeraturanState {}

class SearchPeraturanLoading extends SearchPeraturanState {}

class SearchPeraturanLoaded extends SearchPeraturanState {
  PeraturanSearch data;

  SearchPeraturanLoaded({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchPeraturanLoaded && other.data == data;
  }
}

class SearchPeraturanError extends SearchPeraturanState {}
