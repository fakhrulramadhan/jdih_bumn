import 'package:jdih_bumn/data/model/response/stage/struktur_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/struktur_jdih_datasource.dart';
part 'get_struktur_jdih_event.dart';
part 'get_struktur_jdih_state.dart';

class GetStrukturJdihBloc
    extends Bloc<GetStrukturJdihEvent, GetStrukturJdihState> {
  final StrukturJdihDatasource datasource;
  GetStrukturJdihBloc(this.datasource) : super(GetStrukturJdihInitial()) {
    on<GetStrukturJdihEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DoGetStrukturJdihEvent>((event, emit) async {
      emit(GetStrukturJdihLoading());
      final result = await datasource.getStruktur();
      result.fold((l) => emit(GetStrukturJdihError()),
          (r) => emit(GetStrukturJdihLoaded(data: r)));
    });
  }
}
