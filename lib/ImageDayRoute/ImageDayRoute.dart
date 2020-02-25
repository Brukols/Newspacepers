import 'package:epi_space/SearchImages/SearchImagesRoute.dart';
import 'package:epi_space/news/NewsRssRoute.dart';
import 'package:epi_space/fakenews/fetch_fake_news.dart';
import 'package:flutter/material.dart';
import 'package:epi_space/http/HttpService.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:epi_space/quizz/quizz.dart';

class ImageDayRoute extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        HttpService http = HttpService();
        Future<Map> elems = http.getRequest("https://api.nasa.gov/planetary/apod?api_key=msALziHDtczCBMjvfrvOVW7qR7dYSIsja3pTwdso");

        final loaderPage = Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 150),
            child: CircularProgressIndicator()
        );

        final nasaTitle = FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData) {
                    return (Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(left: 30.0, right: 10.0),
                        child: Text(
                            map.data["title"],
                            style: TextStyle(
                                fontSize: 35
                            ),
                        ),
                    ));
                }
                return (Text(""));
            }
        );

        final nasaImage = FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData)
                    return Stack(
                        children: <Widget>[
                            // Loader properties
                            Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.all(100),
                                child: CircularProgressIndicator()
                            ),

                            // Nasa image properties
                            Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.all(24),
                                child: FadeInImage.memoryNetwork(
                                        placeholder: kTransparentImage,
                                        image: (map.data["media_type"] == "video" ? "https://s3.amazonaws.com/open-nasa-files/images/apod1_copy.original.jpg" : map.data["url"]),
                                        width: 340,
                                        height: 200,
                                        fit: BoxFit.fill,
                                    ),
                            ),
                        ],
                    );
                return (Text(""));
            },
        );

        final date = FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData) {
                    return (Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                            map.data["date"],
                            style: TextStyle(
                                fontSize: 15
                            ),
                        ),
                    ));
                }
                return (Text(""));
            },
        );

        final explanation = FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData) {
                    return (Container(
                        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 10),
                        child: Text(
                            map.data["explanation"],
                            style: TextStyle(
                                fontSize: 19
                            ),
                        ),
                    ));
                }
                return (loaderPage);
            },
        );

        final iconQuote = FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData) {
                    return (Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Icon(
                            Icons.format_quote,
                            color: Colors.blueGrey,
                            size: 50.0,
                        ),
                    ));
                }
                return (Text(""));
            },
        );

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
                                    MaterialPageRoute(builder: (context) =>
                                        ListPage(title: 'Fake News')),
                                );
                            },
                        ),
                        IconButton(
                            icon: Icon(Icons.thumbs_up_down, color: Colors.white),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Quizz()),
                                );
                            },
                        ),
                        IconButton(
                            icon: Icon(Icons.image, color: Colors.white),
                            onPressed: () {},
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

        final topAppBar = AppBar(
            elevation: 0.1,
            backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
            title: Text("Photo du jour"),
            actions: <Widget>[
                Image(
                    image: AssetImage("assets/icon/logo.png")
                )
            ],
        );

        return Scaffold(
            appBar: topAppBar,
            body: ListView(
                children: <Widget>[nasaImage, nasaTitle, date, iconQuote, explanation],
            ),
            bottomNavigationBar: makeBottom,
        );
    }
}