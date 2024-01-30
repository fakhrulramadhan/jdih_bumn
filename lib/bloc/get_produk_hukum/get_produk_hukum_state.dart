part of 'get_produk_hukum_bloc.dart';

abstract class GetProdukHukumState {}

class GetProdukHukumInitial extends GetProdukHukumState {}

class GetProdukHukumLoading extends GetProdukHukumState {}

class GetProdukHukumLoaded extends GetProdukHukumState {
  //ProdukHukumResponseModel data;
  List<ProdukHukumResponseModel> data;
  GetProdukHukumLoaded({
    required this.data,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetProdukHukumLoaded && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class GetProdukHukumError extends GetProdukHukumState {}
