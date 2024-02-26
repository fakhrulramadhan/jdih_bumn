import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
part 'get_page_peraturan_state.dart';

class GetPagePeraturanCubit extends Cubit<GetPagePeraturanState> {
  int currentPage = 1;
  int? page;
  final PeraturanDatasource datasource;

  GetPagePeraturanCubit(this.datasource) : super(GetPagePeraturanInitial());

  void getPeraturanPage() {
    if (state is GetPagePeraturanLoading) return;

    final currentState = state;

    var oldPeraturans = <Item>[];

    if (currentState is GetPagePeraturanLoaded) {
      oldPeraturans = currentState.peraturans;
    }

    emit(GetPagePeraturanLoading(oldPeraturans, isFirstFetch: page == 1));

    datasource.getDataPaging(page: currentPage).then((topPeraturans) {
      currentPage++;

      final peraturans = (state as GetPagePeraturanLoading).oldPeraturans;

      peraturans.addAll(topPeraturans);

      emit(GetPagePeraturanLoaded(peraturans));
    });
  }
}
