import 'package:fluvies/data/network/network_util.dart';
import 'dart:async';
import 'package:fluvies/data/models/Movie.dart';

class NetworkData {
  NetworkUtil _networkUtil;
  
  NetworkData() {
    _networkUtil = new NetworkUtil();
  }
  
  Future<List<Movie>> fetchPopularMovies() {
    return _networkUtil.request("https://api.themoviedb.org/3/movie/popular?"
        "api_key=7416e5acdb6164eb2bac095b0d7c552e&language=en-US&page=1")
      .then((dynamic res) {
      List data = res['results'];
      return data.map((obj) => new Movie.map(obj)).toList();
    });
  }

}