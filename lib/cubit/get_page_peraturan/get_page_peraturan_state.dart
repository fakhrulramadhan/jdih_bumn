part of 'get_page_peraturan_cubit.dart';

abstract class GetPagePeraturanState {}

class GetPagePeraturanInitial extends GetPagePeraturanState {}

class GetPagePeraturanLoaded extends GetPagePeraturanState {
  final List<Item> peraturans;
  GetPagePeraturanLoaded(this.peraturans);
}

class GetPagePeraturanLoading extends GetPagePeraturanState {
  final List<Item> oldPeraturans;
  final bool isFirstFetch;

  GetPagePeraturanLoading(this.oldPeraturans, {this.isFirstFetch = false});
}
