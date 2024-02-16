import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/tentang_jdih_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/tentang_jdih_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/tentang_jdih_response_model.dart';
part 'get_tentang_jdih_event.dart';
part 'get_tentang_jdih_state.dart';

class GetFilterHukumBloc
    extends Bloc<GetTentangJdihEvent, GetTentangJdihState> {
  final TentangJdihDatasource datasource;
  GetFilterHukumBloc(this.datasource) : super(GetTentangJdihInitial()) {
    on<GetTentangJdihEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DoGetTentangJdihEvent>((event, emit) async {
      emit(GetTentangJdihLoading());
      final result = await datasource.getTentangJdih();
      result.fold((l) => emit(GetTentangJdihError()),
          (r) => emit(GetTentangJdihLoaded(data: r)));
    });
  }
}
