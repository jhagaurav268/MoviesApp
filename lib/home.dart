import 'package:flutter/material.dart';
import 'package:glorify_movies_app/utils/text.dart';
import 'package:glorify_movies_app/widgets/top_rated.dart';
import 'package:glorify_movies_app/widgets/trending.dart';
import 'package:glorify_movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiKey = 'f5a5c72646f5a9d02a60f29fd3f2b25f';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNWE1YzcyNjQ2ZjVhOWQwMmE2MGYyOWZkM2YyYjI1ZiIsInN1YiI6IjYxMWIzMTY2YWM0MTYxMDA3M2Q3OGYxYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5CGu_BO2MfKoQhgoAKW_VAueDNzuS_ODkE2RWoCaqZc';
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingResult));
    print((tvResult));
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: ModifiedText(text: 'Flutter Movie App'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            TV(
              tv: tv,
            ),
            TrendingMovies(
              trending: trendingMovies,
            ),
            TopRatedMovies(
              topRated: topRatedMovies,
            ),
          ],
        ));
  }
}
