import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluvies/Injector.dart';
import 'package:fluvies/data/DbHelper.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/custom_widgets/FlexibleAppBar.dart';

class MovieDetails extends StatefulWidget {

  Movie _movie;
  MovieDetails(Movie movie) {
    this._movie = movie;
  }

  @override
  State<StatefulWidget> createState() => new MovieDetailsState(_movie);
}

class MovieDetailsState extends State<MovieDetails> {

  Movie _movie;
  final double _appBarHeight = 256.0;
  MovieDetailsState(this._movie);
  bool isMovieSaved = true;
  DbHelper _dbHelper;
  final String _tag = "liked";

  Widget _loadData(BuildContext context, AsyncSnapshot<bool> snapshot) {
    Widget widget = new Container(width: 0.0, height: 0.0);
    if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError) {

      widget = new IconButton(
        icon: new Icon(Icons.favorite),
        onPressed: () async {
          if (isMovieSaved) {
            await _dbHelper.delete(_movie.id, _tag);
          } else {
            await _dbHelper.insert(_movie, _tag);
          }
          setState(() {
            //refreshing ui
          });
        },
        color: isMovieSaved ? Colors.red : null,
      );
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    _dbHelper = new Injector().dbHelper;

    return new Scaffold(
      body: new CustomScrollView(
          slivers: [
            new SliverAppBar(
              expandedHeight: _appBarHeight,
              flexibleSpace: new FlexibleAppBar("", _movie.backdrop, _movie.id),
            ),
            new SliverList(
                delegate: new SliverChildListDelegate([
                  new Container(
                    padding: const EdgeInsets.all(16.0),
                    child: new Row(
                      children: <Widget>[
                        new Flexible(
                          child: new Text(_movie.name, style: textTheme.headline),
                        ),
                        new FutureBuilder<bool>(
                          builder: _loadData,
                          future: _dbHelper.checkMovie(_movie.id, _tag).then((res) {
                            isMovieSaved = res;
                          }),
                        )
                      ]
                    ),
                  ),
                  new Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      child: new Text(_movie.desc, style: textTheme.subhead)
                  ),

                ])
            )
          ]
      ),
    );

  }
}