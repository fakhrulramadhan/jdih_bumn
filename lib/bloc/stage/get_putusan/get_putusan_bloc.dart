import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/putusan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/putusan_response_model.dart';

part 'get_putusan_event.dart';
part 'get_putusan_state.dart';

class GetPutusanBloc extends Bloc<GetPutusanEvent, GetPutusanState> {
  final PutusanDatasource datasource;

  GetPutusanBloc(this.datasource) : super(GetPutusanInital()) {
    on<GetPutusanEvent>((event, emit) {});

    on<DoGetPutusanEvent>((event, emit) async {
      emit(GetPutusanLoading());

      final result = await datasource.getPutusan();
      result.fold((l) => emit(GetPutusanError()),
          (r) => emit(GetPutusanLoaded(data: r)));
    });
  }
}
