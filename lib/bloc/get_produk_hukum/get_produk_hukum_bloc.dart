import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdih_bumn/data/datasources/produk_hukum_datasource.dart';
import 'package:jdih_bumn/data/model/response/produk_hukum_response_model.dart';

part 'get_produk_hukum_event.dart';
part 'get_produk_hukum_state.dart';

class GetProdukHukumBloc
    extends Bloc<GetProdukHukumEvent, GetProdukHukumState> {
  final ProdukHukumDataSource datasource;
  GetProdukHukumBloc(this.datasource) : super(GetProdukHukumInitial()) {
    on<GetProdukHukumEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DoGetProdukHukumEvent>((event, emit) async {
      emit(GetProdukHukumLoading());

      final result = await datasource.getJdih();

      print(result);

      result.fold((l) => emit(GetProdukHukumError()),
          (r) => emit(GetProdukHukumLoaded(data: r)));
    });
  }
}
