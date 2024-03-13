import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_terbaru_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbaru_response_model.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_terbarus_response_model.dart';

part 'get_peraturan_terbaru_event.dart';
part 'get_peraturan_terbaru_state.dart';

class GetPeraturanTerbaruBloc
    extends Bloc<GetPeraturanTerbaruEvent, GetPeraturanTerbaruState> {
  final PeraturanTerbaruDatasource datasource;

  GetPeraturanTerbaruBloc(this.datasource)
      : super(GetPeraturanTerbaruInitial()) {
    on<GetPeraturanTerbaruEvent>((event, emit) {});

    on<DoGetPeraturanTerbaruEvent>((event, emit) async {
      emit(GetPeraturanTerbaruLoading());

      //final result = await datasource.getPeraturanTerbaru();

      final result = await datasource.getPeraturanTerbarus();

      result.fold((l) => emit(GetPeraturanTerbaruError()),
          (r) => emit(GetPeraturanTerbaruLoaded(data: r)));
    });
  }
}
