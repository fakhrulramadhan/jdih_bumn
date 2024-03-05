part of 'search_putusan_freezed_bloc.dart';

@freezed
class SearchPutusanFreezedEvent with _$SearchPutusanFreezedEvent {
  const factory SearchPutusanFreezedEvent.started() = _Started;
  const factory SearchPutusanFreezedEvent.search(String keyword) = _Search;
}
