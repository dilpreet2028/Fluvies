import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/custom_widgets/movies_grid.dart';
import 'package:fluvies/popular_screen/popular_screen_presenter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PopularScreen extends StatefulWidget {

  @override
  State createState() => new PopularScreenState();
}

class PopularScreenState extends State<PopularScreen> implements PopularScreenView {

  bool _isLoading = true;
  List<Movie> movies;
  PopularScreenPresenter _presenter;

  @override
  void initState() {
    super.initState();
    movies = new List();
    _presenter = new PopularScreenPresenter(this);
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

