import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluvies/Injector.dart';
import 'package:fluvies/custom_widgets/photo_hero.dart';
import 'package:fluvies/data/db_helper.dart';
import 'package:fluvies/data/models/Movie.dart';

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

  Future searchMovie() async {
    isMovieSaved = await _dbHelper.checkMovie(_movie.id, _tag);
    setState((){
      // refresh ui
    });
  }

  @override
  void initState() {
    super.initState();
    _dbHelper = new Injector().dbHelper;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    searchMovie();

    return new Scaffold(
      body: new Column(
        children: <Widget>[
            new PhotoHero(
            photo: _movie.backdrop,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Row(
                children: <Widget>[
                  new Flexible(
                    child: new Text(_movie.name, style: textTheme.headline),
                  ),
                  new IconButton(
                    icon: new Icon(Icons.favorite),
                    onPressed: () async {
                      if (isMovieSaved) {
                        await _dbHelper.delete(_movie.id, _tag);
                      } else {
                        await _dbHelper.insert(_movie, _tag);
                      }
                      searchMovie();
                    },
                    color: isMovieSaved ? Colors.red : null,
                  ),

                ]
            ),
          ),
          new Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: new Text(_movie.desc, style: textTheme.subhead)
          ),
        ],
      )
    );
  }
}