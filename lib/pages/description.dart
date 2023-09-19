// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trizzled_movies/utility/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launchOn;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launchOn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(children: [
        SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: ModifiedText(
                    text: ' ⭐ Average Rating - $vote',
                    size: 15,
                  )),
            ])),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.all(10),
            child: ModifiedText(
              // ignore: prefer_if_null_operators
              text: name != null ? name : "loading",
              size: 24,
            )),
        Container(
            padding: EdgeInsets.only(left: 10),
            child: ModifiedText(text: 'Releasing On - $launchOn', size: 14)),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 100,
              child: Image.network(posterurl),
            ),
            Flexible(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: ModifiedText(text: description, size: 18)),
            ),
          ],
        )
      ]),
    );
  }
}
