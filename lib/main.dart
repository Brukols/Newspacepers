import 'package:epi_space/news/NewsRssRoute.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewSpacepers',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(29, 31, 72, 1.0), fontFamily: 'Raleway'),
      home: new NewsRssRoute(),
    );
  }
}