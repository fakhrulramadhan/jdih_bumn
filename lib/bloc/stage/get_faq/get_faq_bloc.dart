import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/faq_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/faq_response_model.dart';

part 'get_faq_state.dart';
part 'get_faq_event.dart';

class GetFaqBloc extends Bloc<GetFaqEvent, GetFaqState> {
  final FaqDatasource dataSource;

  GetFaqBloc(this.dataSource) : super(GetFaqInitial()) {
    on<GetFaqEvent>((event, emit) {});

    on<DoGetFaqEvent>((event, emit) async {
      emit(GetFaqLoading());
      final result = await dataSource.getFaq();
      result.fold(
          (l) => emit(GetFaqError()), (r) => emit(GetFaqLoaded(data: r)));
    });
  }
}
