import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class SearchImagesRoute extends StatelessWidget
{

    @override
    Widget build(BuildContext context) {

        final searchBar = SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBar(),
            ),
        );

        return Scaffold(
            body: ListView(
                children: <Widget>[searchBar],
            )
        );
  }
}