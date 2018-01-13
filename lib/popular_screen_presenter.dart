import 'package:fluvies/Injector.dart';
import 'package:fluvies/models/Movie.dart';


abstract class PopularScreenView {
  void onMoviesLoaded(List<Movie> movies);
  void onError(String msg);
}

class PopularScreenPresenter {
  PopularScreenView _view;
  String path;
  Injector _injector;

  PopularScreenPresenter(this._view) {
    _injector = new Injector();
  }

  void loadMovies() {
    _injector.fetchPopularMovie().then((list) {
      _view.onMoviesLoaded(list);
    });
  }

}