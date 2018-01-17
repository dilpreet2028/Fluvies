import 'package:flutter/material.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/custom_widgets/movies_grid.dart';
import 'package:fluvies/upcoming_screen/upcoming_screen_presenter.dart';

class UpcomingScreen extends StatefulWidget {

  @override
  State createState() => new UpcomingScreenState();
}

class UpcomingScreenState extends State<UpcomingScreen> implements UpcomingScreenView {

  bool _isLoading = true;
  List<Movie> movies;
  UpcomingScreenPresenter _presenter;

  @override
  void initState() {
    super.initState();
    movies = new List();
    _presenter = new UpcomingScreenPresenter(this, "upcoming");
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

