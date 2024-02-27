import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';

class PeraturanPagingRepository {
  final PeraturanDatasource datasource;

  PeraturanPagingRepository(this.datasource);

  Future<List<Item>> fetchPeraturan(int page) async {
    final peraturans = await datasource.fetchPeraturan(page);

    return peraturans.map((e) => Item.fromJson(e)).toList();
  }
}
