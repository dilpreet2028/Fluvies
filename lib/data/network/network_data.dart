import 'package:fluvies/data/network/network_util.dart';
import 'dart:async';
import 'package:fluvies/data/models/Movie.dart';

class NetworkData {
  NetworkUtil _networkUtil;
  final String apiKey = "PLACE_YOUR_API_KEY_HERE";

  NetworkData() {
    _networkUtil = new NetworkUtil();
  }
  
  Future<List<Movie>> fetchPopularMovies() =>
    _networkUtil.request("https://api.themoviedb.org/3/movie/popular?"
        "api_key=$apiKey&language=en-US&page=1")
      .then((dynamic res) {
      List data = res['results'];
      return data.map((obj) => new Movie.map(obj)).toList();
    });

  Future<List<Movie>> fetchUpcomingMovies() =>
    _networkUtil.request("https://api.themoviedb.org/3/movie/upcoming?"
        "api_key=$apiKey&language=en-US&page=1")
        .then((dynamic res) {
      List data = res['results'];
      List<Movie> movies =  data.map((obj) {
        try {
          return new Movie.map(obj);
        } catch (ex) {
          return null;
        }
      }).toList();
      movies.removeWhere((movie) => movie == null);
      return movies;
    });

}