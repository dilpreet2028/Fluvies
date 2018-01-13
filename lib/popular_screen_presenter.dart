import 'package:fluvies/DbHelper.dart';
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
  DbHelper dbHelper;

  PopularScreenPresenter(this._view, this.path) {
    _injector = new Injector();
    dbHelper = new DbHelper();
    dbHelper.open(path).then((dynamic){
      loadMovies();
    });
  }

  void loadMovies() {
    dbHelper.getMovies("popular").then((list){
      if (list.length > 0 && list != null) {
        _view.onMoviesLoaded(list);
      }
    });

    _injector.fetchPopularMovie().then((list) {
      _view.onMoviesLoaded(list);

    });
  }

}