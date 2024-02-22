import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';

part 'get_peraturan_event.dart';
part 'get_peraturan_state.dart';

class GetPeraturanBloc extends Bloc<GetPeraturanEvent, GetPeraturanState> {
  final PeraturanDatasource datasource;

  GetPeraturanBloc(this.datasource) : super(GetPeraturanInitial()) {
    on<GetPeraturanEvent>((event, emit) {});

    on<DoGetPeraturanEvent>((event, emit) async {
      emit(GetPeraturanLoading());

      final result = await datasource.getPeraturan();

      result.fold((l) => emit(GetPeraturanError()),
          (r) => emit(GetPeraturanLoaded(data: r)));
    });
  }
}
