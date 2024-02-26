import 'package:flutter/cupertino.dart';
import 'package:jdih_bumn/data/model/response/stage/peraturan_response_model.dart';
import 'package:jdih_bumn/data/datasources/stage/peraturan_datasource.dart';

enum LoadMoreStatus { LOADING, STABLE }

class PeraturanPaging with ChangeNotifier {
  late PeraturanDatasource _datasource;
  late PeraturanResponseModel _dataModel;

  int totalPages = 0;
  int pageSize = 30;

  List<Item>? get allPeraturan => _dataModel.items;
}
