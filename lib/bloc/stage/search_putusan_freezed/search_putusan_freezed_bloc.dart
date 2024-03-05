import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jdih_bumn/data/datasources/stage/putusan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_putusan_freezed_event.dart';
part 'search_putusan_freezed_state.dart';
part 'search_putusan_freezed_bloc.freezed.dart';

class SearchPutusanFreezedBloc
    extends Bloc<SearchPutusanFreezedEvent, SearchPutusanFreezedState> {
  final PutusanDatasource datasource;

  SearchPutusanFreezedBloc(this.datasource) : super(const _Initial()) {
    on<_Search>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.searchPutusan(event.keyword);
      result.fold(
        (l) => emit(const _Error()),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
