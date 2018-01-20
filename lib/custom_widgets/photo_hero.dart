import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: new Hero(
          tag: photo,
          child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: onTap,
              child: new Image.network(
                  photo,
                fit: BoxFit.cover,
              ),
            ),
          )
      ),
    );
  }
}