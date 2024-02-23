//import 'package:jdih_bumn/data/model/response/stage/peraturan_populer_response_model.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_populer_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_populer_response_model.dart';

part 'get_peraturan_populer_event.dart';
part 'get_peraturan_populer_state.dart';

class GetPeraturanPopulerBloc
    extends Bloc<GetPeraturanPopulerEvent, GetPeraturanPopulerState> {
  final PeraturanPopulerDatasource datasource;

  GetPeraturanPopulerBloc(this.datasource)
      : super(GetPeraturanPopulerStateInitial()) {
    on<GetPeraturanPopulerEvent>((event, emit) {});

    on<DoGetPeraturanPopulerEvent>((event, emit) async {
      emit(GetPeraturanPopulerStateLoading());

      final result = await datasource.getPeraturanPopuler();

      result.fold((l) => emit(GetPeraturanPopulerStateError()),
          (r) => emit(GetPeraturanPopulerStateLoaded(data: r)));
    });
  }
}
