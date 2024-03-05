part of 'search_putusan_bloc.dart';

abstract class SearchPutusanEvent {}

class DoSearchPutusanEvent extends SearchPutusanEvent {
  final String? keyword;

  DoSearchPutusanEvent({this.keyword});
}
