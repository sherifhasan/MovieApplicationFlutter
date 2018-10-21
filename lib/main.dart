import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'presentation/movie_cell.dart';
import 'details_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MoviesState();
  }
}

class MoviesState extends State<MyApp> {
  var _isLoading = true;
  var movies;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Movie App"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.refresh),
            onPressed: () {
              _fetchData();
            },
          )
        ],
      ),
      body: new Center(
        child: _isLoading
            ? new CircularProgressIndicator()
            : new ListView.builder(
                itemCount: this.movies != null ? this.movies.length : 0,
                itemBuilder: (context, i) {
                  final movie = this.movies[i];
                  return new FlatButton(
                      padding: new EdgeInsets.all(0.0),
                      onPressed: () {
                        print("movie cell pressed");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new DetailPage(movie)));
                      },
                      child: new MovieCell(movie));
                }),
      ),
    ));
  }

  _fetchData() async {
    print("Attemping to fetch data from network");
    final url =
        "https://api.themoviedb.org/3/movie/popular?api_key=e48aff998933389fb8b85b6b1666842f";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final moviesJson = map["results"];
      setState(() {
        _isLoading = false;
        this.movies = moviesJson;
      });
    }
  }
}