import 'package:flutter/material.dart';
import 'package:fluvies/custom_widgets/photo_hero.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/movie_details_screen.dart';
import 'package:meta/meta.dart';
import 'package:fluvies/Injector.dart';

Widget getMoviesGrid({@required List<Movie> movies, @required BuildContext
      context, @required int crossAxisCount, Axis scroll = Axis.vertical }) {

  if (movies.length == 0) {
    return new Container(
      child: new Center(
        child: new Text("No Movies found")
      ),
    );
  }

  return new GridView.count(
      crossAxisCount: crossAxisCount,
      scrollDirection: scroll,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      padding: const EdgeInsets.all(4.0),
      children: movies.map((movie) =>
      new Card(
        child: new  GridTile(
            child: new PhotoHero(
              photo: movie.backdrop,
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new MovieDetails(movie);
                }));
              },
            ),
            footer: new GridTileBar(
                backgroundColor: Colors.black45,
                title: new FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: new Text(movie.name),
                )
            )
        ),
      )).
      toList());
}