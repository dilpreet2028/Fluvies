import 'package:fluvies/base/screen_presenter.dart';
import 'package:fluvies/base/screen_view.dart';

abstract class UpcomingScreenView extends ScreenView {

}

class UpcomingScreenPresenter extends ScreenPresenter<UpcomingScreenView> {

  UpcomingScreenPresenter(ScreenView view, String tag) : super(view, tag);

  @override
  void loadMovies() {
    super.loadMovies();

    networkData.fetchUpcomingMovies().then((list) {
      view.onMoviesLoaded(list);
      dbHelper.insertMovies(list, tag).then((dynamic) {
        print("Db updated with new $tag movies");
      });
    });

  }

}