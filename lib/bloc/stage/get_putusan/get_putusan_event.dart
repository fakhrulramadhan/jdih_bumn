part of 'get_putusan_bloc.dart';

abstract class GetPutusanEvent {}

class DoGetPutusanEvent extends GetPutusanEvent {
  final String search;

  DoGetPutusanEvent({required this.search});
}
