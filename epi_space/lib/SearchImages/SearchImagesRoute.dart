import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';

class SearchImagesRoute extends StatelessWidget
{
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Recherche"),
            ),
            body: SafeArea(
                child: Center(
                    child: ViewSearchImage(),
                ),
            ),
        );
  }
}

class ViewSearchImage extends StatefulWidget
{
    @override
    ViewSearchImageState createState() => ViewSearchImageState();
}

class ViewSearchImageState extends State
{
    bool _noResult = true;
    TextEditingController _controller = new TextEditingController();

    void displayNoResult()
    {
        setState(() {
          _noResult = true;
        });
    }

    void hideNoResult()
    {
        setState(() {
          _noResult = false;
        });
    }

    @override
    Widget build(BuildContext context) {
        final iconNoResult = Visibility(
            visible: _noResult,
            child: Container(
                margin: EdgeInsets.only(top: 150),
                color: Color.fromRGBO(255, 255, 255, 0),
                child: Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                    size: 100,
                ),
            ),
        );

        final textNoResult = Visibility(
            visible: _noResult,
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                    "Aucun résultat",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                    ),
                ),
            ),
        );

        void textSubmit(String text)
        {
            if (text.isNotEmpty) {
                hideNoResult();
            } else {
                displayNoResult();
            }
        }

        final searchBar = Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 10),
            child: TextField(
                controller: _controller,
                onSubmitted: textSubmit,
                style: TextStyle(
                    fontSize: 18
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Rechercher une image...",
                    filled: true,
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                    ),
                ),
            ),
        );
        return Scaffold(
            body: ListView(
                children: <Widget>[searchBar, iconNoResult, textNoResult],
            ),
        );
    }
}