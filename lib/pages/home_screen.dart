// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:trizzled_movies/constant.dart';
import 'package:trizzled_movies/pages/searchpage.dart';
import 'package:trizzled_movies/widgets/top_movies.dart';
import 'package:trizzled_movies/widgets/toprated_shows.dart';
import 'package:trizzled_movies/widgets/trending_movies.dart';
import 'package:trizzled_movies/utility/text.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final String apiKey = apikey;
  final String readaccesstoken = readAccesstoken;
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  List trendingMovies = [];
  List topmovies = [];
  List topTvShows = [];
  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbwithcustomlogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingResult = await tmdbwithcustomlogs.v3.trending.getTrending();
    Map moviesResult = await tmdbwithcustomlogs.v3.movies.getTopRated();
    Map showsResult = await tmdbwithcustomlogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topmovies = moviesResult['results'];
      topTvShows = showsResult['results'];
    });
    // print(trendingMovies);
    // print(topMovies);
    // print(showsResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: ModifiedText(
            text: appName,
            size: 25,
          ),
          backgroundColor: Colors.transparent,
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SearchPage())),
                icon: const Icon(Icons.search))
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: [
            buildNavItem(Icons.favorite, 'favorite'),
            buildNavItem(Icons.sort, 'Sort'),
            buildNavItem(Icons.home, 'Home'),
            buildNavItem(Icons.local_movies, 'Movies'),
            buildNavItem(Icons.person, 'Profile'),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.cyan,
          backgroundColor: Colors.black,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {});
          },
          letIndexChange: (index) => true,
        ),
        body: ListView(
          children: [
            TopRatedShows(topRated: topTvShows),
            TrendingMovies(trending: trendingMovies),
            TopMovies(topMovies: topmovies)
          ],
        ));
  }
}

Widget buildNavItem(IconData icon, String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 30),
      SizedBox(height: 4),
      Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    ],
  );
}
