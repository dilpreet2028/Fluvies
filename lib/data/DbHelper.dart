import 'dart:async';
import 'dart:io';

import 'package:fluvies/data/models/Movie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  Database _db;
  String path;
  final String tbName = "movies";
  final String id = "id";
  final String name = "name";
  final String poster = "poster";
  final String backdrop = "backdrop";
  final String desc = "desc";
  final String tag = "tag";

  Future open(String path) async {
    print("open db $path");
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int ver) async {
      await db.execute('''create table $tbName ( $id integer primary key ,
      $name text not null, $poster text not null, $backdrop text not null, 
      $desc text not null, $tag text not null)''');
    });

  }

  Map toMap(Movie movie, String movieTag) {
    Map map = {id : movie.id, name : movie.name, poster: movie.poster,
        backdrop : movie.backdrop, desc : movie.desc, tag : movieTag};
    return map;
  }

  Future insert(Movie movie, String movieTag) async {
    await _db.insert(tbName, toMap(movie, movieTag));
  }

  Future insertMovies(List<Movie> movies, String movieTag) async {
    await _db.delete(tbName, where: "$tag = ?", whereArgs: [movieTag]);
    Batch batch = _db.batch();
    for (Movie movie in movies) {
      batch.insert(tbName, toMap(movie, movieTag));
    }
    await batch.commit();
  }

  Future<List<Movie>> getAllMovies() async {
    List<Map> movies = await _db.query(tbName);
    return movies.map((mapped) => new Movie.fromDb(mapped)).toList();
  }

  Future<List<Movie>> getMovies(String movieTag) async {
    List<Map> movies = await _db.query(tbName, where: "$tag = ?",
        whereArgs: [movieTag]);
    return movies.map((mapped) => new Movie.fromDb(mapped)).toList();
  }

  Future<int> delete(int movieId) async {
    return await _db.delete(tbName, where: "$id = ?", whereArgs: [movieId]);
  }

}
