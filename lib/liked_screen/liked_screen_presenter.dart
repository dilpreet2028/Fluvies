import 'package:fluvies/base/screen_presenter.dart';
import 'package:fluvies/base/screen_view.dart';

abstract class LikedScreenView extends ScreenView {

}

class LikedScreenPresenter extends ScreenPresenter<LikedScreenView> {

  LikedScreenPresenter(ScreenView view, String tag) : super(view, tag);

  @override
  void loadMovies() {
    super.loadMovies();
    //nothing to fetch
  }

}