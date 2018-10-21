import 'package:flutter/material.dart';
import 'presentation/StarRating.dart';
import 'presentation/movie_cell.dart';

class DetailPage extends StatelessWidget {
  final movie;

  DetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    final releaseDate = movie["release_date"];
    final rating = movie["vote_average"];
    double rate = (double.parse(rating.toString())) / 2;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(movie["title"]),
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(
                MovieCell.BASE_POSTER_URL + movie["backdrop_path"],
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Overview",
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  movie["overview"],
                  style: new TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(8.0),
                child: new StarRating(
                  rating: rate,
                  color: Colors.red,
                ),
              ),
              new Container(
                width: 100.0,
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
          ),
        ],
      ),
    );
  }
}