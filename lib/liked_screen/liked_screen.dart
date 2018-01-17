import 'package:flutter/material.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/custom_widgets/movies_grid.dart';
import 'package:fluvies/liked_screen/liked_screen_presenter.dart';

class LikedScreen extends StatefulWidget {

  @override
  State createState() => new LikedScreenState();
}

class LikedScreenState extends State<LikedScreen> implements LikedScreenView {

  bool _isLoading = true;
  List<Movie> movies;
  LikedScreenPresenter _presenter;

  @override
  void initState() {
    super.initState();
    movies = new List();
    _presenter = new LikedScreenPresenter(this, "liked");
    _presenter.loadMovies();
  }

  @override
  void onError(String msg) {
    print(msg);
  }

  @override
  void onMoviesLoaded(List<Movie> list) {
    setState((){
      _isLoading = false;
      movies = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_isLoading) {
      widget = new Center(
          child: new CircularProgressIndicator()
      );
    } else {
      return getMoviesGrid(movies: movies, context: context, crossAxisCount: 2);
    }
    return widget;
  }

}

