import 'dart:async';

import 'package:fluvies/models/Movie.dart';
import 'package:fluvies/network/network_data.dart';

class Injector {

  static final Injector injector = new Injector._injector();
  NetworkData _networkData;

  Injector._injector(){
    _networkData = new NetworkData();
  }

  factory Injector() {
    return injector;
  }

  NetworkData get networkData => _networkData;

  Future<List<Movie>> fetchPopularMovie() {
    return _networkData.fetchPopularMovies();
  }

}