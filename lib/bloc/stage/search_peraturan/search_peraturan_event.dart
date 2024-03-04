part of 'search_peraturan_bloc.dart';

abstract class SearchTentangJdihEvent {}

class DoSearchTentangJdihEvent extends SearchTentangJdihEvent {
  final String? judul;
  final String? nomor_peraturan_baru;

  DoSearchTentangJdihEvent({this.judul, this.nomor_peraturan_baru});
}
