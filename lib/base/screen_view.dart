import 'package:fluvies/data/models/Movie.dart';


abstract class ScreenView {
  void onMoviesLoaded(List<Movie> movies);
  void onError(String msg);
}