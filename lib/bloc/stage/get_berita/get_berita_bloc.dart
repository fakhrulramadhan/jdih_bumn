import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/stage/berita_datasource.dart';
import 'package:jdih_bumn/data/model/response/stage/berita_response_model.dart';

part 'get_berita_event.dart';
part 'get_berita_state.dart';

class GetBeritaBloc extends Bloc<GetBeritaEvent, GetBeritaState> {
  final BeritaDatasource datasource;

  GetBeritaBloc(this.datasource) : super(GetBeritaInital()) {
    on<GetBeritaEvent>((event, emit) {});

    on<DoGetBeritaEvent>((event, emit) async {
      emit(GetBeritaLoading());

      final result = await datasource.getBerita();

      result.fold(
          (l) => emit(GetBeritaError()), (r) => GetBeritaLoaded(data: r));
    });
  }
}