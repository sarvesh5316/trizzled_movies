// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:trizzled_movies/pages/description.dart';
import 'package:trizzled_movies/utility/text.dart';

class TopMovies extends StatelessWidget {
  final List topMovies;

  const TopMovies({Key? key, required this.topMovies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            size: 26,
          ),
          SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topMovies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: topMovies[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              topMovies[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              topMovies[index]['poster_path'],
                                      description: topMovies[index]['overview'],
                                      vote: topMovies[index]['vote_average']
                                          .toString(),
                                      launchOn: topMovies[index]
                                          ['release_date'],
                                    )));
                      },
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          topMovies[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            ModifiedText(
                                size: 15,
                                text: topMovies[index]['title'] != null
                                    ? topMovies[index]['title']
                                    : 'Loading')
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
