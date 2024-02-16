part of 'get_peraturan_hukum_bloc.dart';

abstract class GetPeraturanHukumState {}

class GetPeraturanHukumInitial extends GetPeraturanHukumState {}

class GetPeraturanHukumLoading extends GetPeraturanHukumState {}

class GetPeraturanHukumLoaded extends GetPeraturanHukumState {
  PeraturanHukumResponseModel data;

  //Item data;
  //List<Item> items;
  GetPeraturanHukumLoaded({
    required this.data,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetPeraturanHukumLoaded && other.data == data;
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is GetPeraturanHukumLoaded && listEquals(other.items, items);
  // }

  @override
  int get hashCode => data.hashCode;
}

class GetPeraturanHukumError extends GetPeraturanHukumState {}
