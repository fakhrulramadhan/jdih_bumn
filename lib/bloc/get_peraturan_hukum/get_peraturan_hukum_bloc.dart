import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/peraturan_hukum_datasource.dart';
import 'package:jdih_bumn/data/model/response/peraturan_hukum_response_model.dart';

part 'get_peraturan_hukum_event.dart';
part 'get_peraturan_hukum_state.dart';

class GetPeraturanHukumBloc
    extends Bloc<GetPeraturanHukumEvent, GetPeraturanHukumState> {
  final PeraturanHukumDatasource datasource;
  GetPeraturanHukumBloc(this.datasource) : super(GetPeraturanHukumInitial()) {
    on<GetPeraturanHukumEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DoGetPeraturanHukumEvent>((event, emit) async {
      //emit(GetPeraturanHukumLoading());
      final result = await datasource.getPeraturan();

      print(result);

      //jangan lupa emit untuk update ui statenya
      result.fold((l) => emit(GetPeraturanHukumError()),
          (r) => emit(GetPeraturanHukumLoaded(data: r)));

      // result.fold((l) => emit(GetPeraturanHukumError()), (r) {
      //   print(r);
      //   return GetPeraturanHukumLoaded(data: r);
      // });

      //print(r);
    });

    // on<DoGetPeraturanHukumEvent>((event, emit) async {
    //   emit(GetPeraturanHukumLoading());
    //   final result = await datasource.getPeraturan();

    //   result.fold((l) => emit(GetPeraturanHukumError()),
    //       (r) => GetPeraturanHukumLoaded(data: r, items: []));
    // });
  }
}
