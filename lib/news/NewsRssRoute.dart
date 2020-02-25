import 'package:epi_space/ImageDayRoute/ImageDayRoute.dart';
import 'package:epi_space/SearchImages/SearchImagesRoute.dart';
import 'package:epi_space/fakenews/fetch_fake_news.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:epi_space/news/MyWebView.dart';
import 'package:epi_space/quizz/quizz.dart';
import 'package:http/http.dart' as http;

class NewsRssRoute extends StatefulWidget {
    @override
    _NewsRssState createState() => new _NewsRssState();
}

class _NewsRssState extends State<NewsRssRoute> {

    final _targetUrl = 'https://www.sciencesetavenir.fr/espace/rss.xml';
    @override
    Widget build(BuildContext context) {
        var futureBuilder = new FutureBuilder(
            future: getFeed(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator(),
                        heightFactor: 10);
                    default:
                        if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                        else
                            return createListView(context, snapshot);
                }
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
                            onPressed: () {},
                        ),
                        IconButton(
                            icon: Icon(Icons.thumb_down, color: Colors.white),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ListPage(title:"News")),
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

        final topAppBar = AppBar(
            elevation: 0.1,
            backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
            title: Text("NewSpacepers"),
            actions: <Widget>[
                Image(
                    image: AssetImage("assets/icon/logo.png")
                )
            ],
        );

        return new Scaffold(
            appBar: topAppBar,
            body: futureBuilder,
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            bottomNavigationBar: makeBottom,
        );
    }

    Future<RssFeed> getFeed() =>
        http.read(_targetUrl).then((xmlString) => RssFeed.parse(xmlString));

    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
        List<RssItem> values = snapshot.data.items;
        return new ListView.builder(
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) {
                return new Column(
                    children: <Widget>[Card(
                        child: ListTile(
                            leading: Image.network(values[index].enclosure.url),
                            title: Text(values[index].title),
                            subtitle: Text(values[index].description),

                            trailing: Icon(Icons.navigate_next),
                            isThreeLine: true,
                            onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyWebView(
                                            title: values[index].title,
                                            selectedUrl: values[index].link,
                                        )
                                    ));
                                },
                            ),
                        ),
                    ],
                );
            },
        );
    }
}