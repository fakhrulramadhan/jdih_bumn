part of 'search_putusan_freezed_bloc.dart';

@freezed
class SearchPutusanFreezedState with _$SearchPutusanFreezedState {
  const factory SearchPutusanFreezedState.initial() = _Initial;
  const factory SearchPutusanFreezedState.loading() = _Loading;
  const factory SearchPutusanFreezedState.loaded(PutusanResponseModel data) =
      _Loaded;
  const factory SearchPutusanFreezedState.error() = _Error;
}
