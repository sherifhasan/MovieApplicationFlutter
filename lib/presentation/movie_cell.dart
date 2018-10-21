import 'package:flutter/material.dart';
import '../presentation/StarRating.dart';

class MovieCell extends StatelessWidget {
  final movie;
  static const String BASE_POSTER_URL = "http://image.tmdb.org/t/p/w342";

  MovieCell(this.movie);

  @override
  Widget build(BuildContext context) {
    final rating = movie["vote_average"];
    double rate = (double.parse(rating.toString())) / 2;
    final releaseDate = movie["release_date"];
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new Image.network(BASE_POSTER_URL + movie["poster_path"]),
              new Container(
                height: 8.0,
              ),
              new Row(
                children: <Widget>[
                  new StarRating(
                    rating: rate,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 108.0,
                  ),
                  new Text(
                    releaseDate,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ],
              )
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
