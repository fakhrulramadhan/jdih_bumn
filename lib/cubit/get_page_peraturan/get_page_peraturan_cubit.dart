import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
import 'package:jdih_bumn/data/repositories/peraturan_paging_repository.dart';
part 'get_page_peraturan_state.dart';

class GetPagePeraturanCubit extends Cubit<GetPagePeraturanState> {
  //int currentPage = 1;
  int page = 1;
  final PeraturanPagingRepository repository;

  GetPagePeraturanCubit(this.repository) : super(GetPagePeraturanInitial());

  void loadPeraturanPage() {
    if (state is GetPagePeraturanLoading) return;

    final currentState = state;

    var oldPeraturans = <Item>[];

    if (currentState is GetPagePeraturanLoaded) {
      oldPeraturans = currentState.peraturans;
    }

    emit(GetPagePeraturanLoading(oldPeraturans, isFirstFetch: page == 1));

    repository.fetchPeraturan(page).then((newPeraturan) {
      page++;

      final peraturans = (state as GetPagePeraturanLoading).oldPeraturans;

      peraturans.addAll(newPeraturan);

      emit(GetPagePeraturanLoaded(peraturans));
    });
  }
}
