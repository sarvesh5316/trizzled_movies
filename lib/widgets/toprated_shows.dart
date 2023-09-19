// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:trizzled_movies/pages/description.dart';
import 'package:trizzled_movies/utility/text.dart';

class TopRatedShows extends StatelessWidget {
  final List topRated;

  const TopRatedShows({Key? key, required this.topRated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Shows',
            size: 26,
          ),
          SizedBox(height: 10),
          SizedBox(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topRated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: topRated[index]['name'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              topRated[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              topRated[index]['poster_path'],
                                      description: topRated[index]['overview'],
                                      vote: topRated[index]['vote_average']
                                          .toString(),
                                      launchOn: topRated[index]
                                          ['first_air_date'],
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
                                          topRated[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                                height: 50,
                                child: ModifiedText(
                                    size: 15,
                                    text:
                                        topRated[index]['name'] ?? 'Loading')),
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
