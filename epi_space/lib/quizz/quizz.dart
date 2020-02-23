import 'package:epi_space/fakenews/fake_news.dart';
import 'package:epi_space/fakenews/fetch_fake_news.dart';
import 'package:epi_space/news/NewsRssRoute.dart';
import 'package:epi_space/ImageDayRoute/ImageDayRoute.dart';
import 'package:epi_space/SearchImages/SearchImagesRoute.dart';
import 'package:flutter/material.dart';

class Quizz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(29, 31, 72, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.thumb_up, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsRssRoute()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.thumb_down, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage(title:"Fake News")),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.thumbs_up_down, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.image, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageDayRoute()),
                );},
            ),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchImagesRoute()),
                );
              },
            )
          ],
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[]
      ),
      bottomNavigationBar: makeBottom,
    );
  }
}