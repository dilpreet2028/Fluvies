import 'dart:async';

import 'package:fluvies/data/DbHelper.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/data/network/network_data.dart';

class Injector {

  static final Injector injector = new Injector._injector();
  NetworkData _networkData;
  DbHelper _dbHelper;

  Injector._injector(){
    _networkData = new NetworkData();
    _dbHelper = new DbHelper();
  }

  factory Injector() {
    return injector;
  }

  Future setupDbPath(String path) async {
    await _dbHelper.open(path);
  }

  NetworkData get networkData => _networkData;

  DbHelper get dbHelper => _dbHelper;

  Future<List<Movie>> fetchPopularMovie() {
    return _networkData.fetchPopularMovies();
  }

}