import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/filter_hukum_datasource.dart';
import 'package:jdih_bumn/data/model/response/filter_hukum_response_model.dart';
part 'get_filter_hukum_event.dart';
part 'get_filter_hukum_state.dart';

class GetFilterHukumBloc
    extends Bloc<GetFilterHukumEvent, GetFilterHukumState> {
  final FilterHukumDatasource datasource;
  GetFilterHukumBloc(this.datasource) : super(GetFilterHukumInitial()) {
    on<GetFilterHukumEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DoGetFilterHukumEvent>((event, emit) async {
      emit(GetFilterHukumLoading());
      final result = await datasource.getDataByParam();
      result.fold((l) => emit(GetFilterHukumError()),
          (r) => emit(GetFilterHukumLoaded(data: r)));
    });
  }
}
