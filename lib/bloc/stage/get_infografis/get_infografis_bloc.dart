import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/infografis_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/infografis_response_model.dart';
part 'get_infografis_event.dart';
part 'get_infografis_state.dart';

class GetInfografisBloc extends Bloc<GetInfografisEvent, GetInfografisState> {
  final InfografisDatasource datasource;

  GetInfografisBloc(this.datasource) : super(GetInfografisInitial()) {
    on<GetInfografisEvent>((event, emit) {});

    on<DoGetInfografisEvent>((event, emit) async {
      emit(GetInfografisLoading());

      final result = await datasource.getInfografis();

      result.fold((l) => emit(GetInfografisError()),
          (r) => emit(GetInfografisLoaded(data: r)));
    });
  }
}
