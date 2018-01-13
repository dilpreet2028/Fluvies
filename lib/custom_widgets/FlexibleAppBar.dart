import 'package:flutter/material.dart';

class FlexibleAppBar extends AppBar {
  static const double height = 256.0;

  FlexibleAppBar(String title, String imageUrl, int id) : super(
      flexibleSpace: new FlexibleSpaceBar(
          title: new Text(title),
          background: _buildBackground(imageUrl, id)
      )
  );

  static Widget _buildBackground(String imageUrl, int id) {
    return new Stack (
        fit: StackFit.expand,
        children: <Widget>[
          new Hero(
            tag: id,
            child: new Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: height
            ),
          )
        ]
    );
  }

}