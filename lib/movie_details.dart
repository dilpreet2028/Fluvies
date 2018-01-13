import 'package:flutter/material.dart';
import 'package:fluvies/models/Movie.dart';
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

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
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
                    child: new Text(_movie.name, style: textTheme.headline),
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