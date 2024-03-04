part of 'search_peraturan_bloc.dart';

abstract class SearchPeraturanEvent {}

class DoSearchPeraturanEvent extends SearchPeraturanEvent {
  final String keyword;

  DoSearchPeraturanEvent({required this.keyword});
}
