import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/disclaimer_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/disclaimer_response_model.dart';

part 'get_disclaimer_event.dart';
part 'get_disclaimer_state.dart';

class GetDisclaimerBloc extends Bloc<GetDisclaimerEvent, GetDisclaimerState> {
  final DisclaimerDatasource datasource;

  GetDisclaimerBloc(this.datasource) : super(GetDisclaimerInitial()) {
    on<GetDisclaimerEvent>((event, emit) {});

    //pada saat event ambil (get) data disclaimer
    on<DoGetDisclaimerEvent>((event, emit) async {
      emit(GetDisclaimerLoading());

      final result = await datasource.getDisclaimer();

      result.fold((l) => emit(GetDisclaimerError()),
          (r) => emit(GetDisclaimerLoaded(data: r)));
    });
  }
}
