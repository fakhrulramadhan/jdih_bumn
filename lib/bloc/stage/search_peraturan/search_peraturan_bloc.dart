import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/search_peraturan_response_model.dart';

import '../../../data/model/response/stage/peraturan_response_model.dart';

part 'search_peraturan_event.dart';
part 'search_peraturan_state.dart';

class SearchPeraturanBloc
    extends Bloc<SearchPeraturanEvent, SearchPeraturanState> {
  final PeraturanDatasource datasource;

  SearchPeraturanBloc(this.datasource) : super(SearchPeraturanInital()) {
    // on<DoSearchPeraturanEvent>((event, emit) async {
    //   emit(SearchPeraturanLoading());
    //   final result = await datasource.getSearchPeraturan(event.keyword);
    //   result.fold((l) => emit(SearchPeraturanLoading()),
    //       (r) => emit(SearchPeraturanLoaded(data: r)));
    // });
  }
}
