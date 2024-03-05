import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/putusan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';

part 'search_putusan_event.dart';
part 'search_putusan_state.dart';

class SearchPutusanBloc extends Bloc<SearchPutusanEvent, SearchPutusanState> {
  final PutusanDatasource datasource;

  SearchPutusanBloc(this.datasource) : super(SearchPutusanInitial()) {
    on<SearchPutusanEvent>((event, emit) {});

    on<DoSearchPutusanEvent>((event, emit) async {
      emit(SearchPutusanLoading());

      final result = await datasource.searchPutusan(event.keyword!);

      result.fold((l) => emit(SearchPutusanError()),
          (r) => emit(SearchPutusanLoaded(data: r)));
    });
  }
}
