import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluvies/Injector.dart';
import 'package:fluvies/models/Movie.dart';
import 'package:fluvies/popular_screen.dart';
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

  void _onBottomBarTapped(int indexClicked) {
    setState((){
      _page = indexClicked;
    });
  }


  @override
  void initState() {
    super.initState();

  }

  Widget loadPage() {
    Widget widget;
    switch (_page) {
      case 0:
        widget = new PopularScreen();
        break;

    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fluvies"),
        elevation: 2.0,
      ),
      body: loadPage(),
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
                icon: new Icon(Icons.save),
                title: new Text("Saved")
            ),
          ]
      ),
    );

  }

  @override
  void dispose() {
    super.dispose();
  }

}
