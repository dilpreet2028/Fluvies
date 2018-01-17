import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluvies/Injector.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/liked_screen/liked_screen.dart';
import 'package:fluvies/popular_screen/popular_screen.dart';
import 'package:fluvies/upcoming_screen/upcoming_screen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(
  new MaterialApp(
    title: "Fluvies",
    theme: new ThemeData(
      primarySwatch: Colors.teal,
      accentColor: Colors.tealAccent,
      backgroundColor: Colors.grey[100]
    ),
    home: new HomePage(),
  )
);

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new HomeStatePage();

}

class HomeStatePage extends State<HomePage> {
  int _page = 0;
  Future<Directory> _documentsDirectory;

  void _getDocumentDirectory() {
    setState(() {
      _documentsDirectory = getApplicationDocumentsDirectory();
    });
  }

  void _onBottomBarTapped(int indexClicked) {
    setState((){
      _page = indexClicked;
    });
  }

  Widget _loadPage(BuildContext context, AsyncSnapshot<Directory> snapshot) {
    Widget widget = new Container(width: 0.0, height: 0.0);
    if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError) {
      switch (_page) {
        case 0:
          widget = new PopularScreen();
          break;
        case 1:
          widget = new UpcomingScreen();
          break;
        case 2:
          widget = new LikedScreen();
          break;
      }
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    _getDocumentDirectory();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fluvies"),
        elevation: 2.0,
      ),
      body: new FutureBuilder(
          builder: _loadPage,
          future: _documentsDirectory.then((directory) async {
            String path = join(directory.path, "movies.db");
            if (!await new Directory(dirname(path)).exists()) {
              try {
                await new Directory(dirname(path)).create(recursive: true);
              } catch (e) {
                print(e);
              }
            }
            await new Injector().setupDbPath(path);
          }),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _page,
          onTap: _onBottomBarTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.new_releases),
                title: new Text("Popular"),
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.update),
                title: new Text("Upcoming")
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.favorite),
                title: new Text("Liked")
            ),
          ]
      ),
    );

  }

}
