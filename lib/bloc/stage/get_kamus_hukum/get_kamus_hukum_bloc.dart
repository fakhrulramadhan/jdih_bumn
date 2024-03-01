import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/kamus_hukum_datasource.dart';

import '../../../data/model/response/stage/kamus_hukum_response_model.dart';

part 'get_kamus_hukum_state.dart';
part 'get_kamus_hukum_event.dart';

class GetKamusHukumBloc extends Bloc<GetKamusHukumEvent, GetKamusHukumState> {
  final KamusHukumDatasource datasource;
  GetKamusHukumBloc(this.datasource) : super(GetKamusHukumInitial()) {
    on<GetKamusHukumEvent>((event, emit) {});

    on<DoGetKamusHukumEvent>((event, emit) async {
      emit(GetKamusHukumLoading()); //update ui

      final result = await datasource.getKamusHukum();
      result.fold((l) => emit(GetKamusHukumError()),
          (r) => emit(GetKamusHukumLoaded(data: r)));
    });

    on<DoGetKamusHukumEventList>((event, emit) async {
      emit(GetKamusHukumLoading()); //update ui

      final result = await datasource.getKamusHukum();
      // result.fold((l) => emit(GetKamusHukumError()),
      //     (r) => emit(GetKamusHukumLoaded(data: r)));

      //final List<List<Item>> pages = _splitList(posts, 4);
    });
  }
}

List<List<T>> _splitList<T>(List<T> list, int chunkSize) {
  List<List<T>> chunks = [];
  for (var i = 0; i < list.length; i += chunkSize) {
    var end = (i + chunkSize < list.length) ? i + chunkSize : list.length;
    chunks.add(list.sublist(i, end));
  }
  return chunks;
}
