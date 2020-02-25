import 'package:epi_space/ImageDayRoute/ImageDayRoute.dart';
import 'package:flutter/material.dart';
import 'package:epi_space/http/HttpService.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:epi_space/news/MyWebView.dart';
import 'package:epi_space/news/NewsRssRoute.dart';
import 'package:epi_space/fakenews/fetch_fake_news.dart';
import 'package:epi_space/quizz/quizz.dart';

class SearchImagesRoute extends StatelessWidget
{

    @override
    Widget build(BuildContext context) {

        final topAppBar = AppBar(
            elevation: 0.1,
            backgroundColor: Color.fromRGBO(29, 31, 72, 1.0),
            title: Text("Recherche"),
            actions: <Widget>[
                Image(
                    image: AssetImage("assets/icon/logo.png")
                )
            ],
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
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ImageDayRoute()),
                                );
                            },
                        ),
                        IconButton(
                            icon: Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                            },
                        )
                    ],
                ),
            ),
        );

        return Scaffold(
            appBar: topAppBar,
            body: SafeArea(
                child: Center(
                    child: ViewSearchImage(),
                ),
            ),
            bottomNavigationBar: makeBottom,
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
          _noResult = true;
        });
    }

    @override
    Widget build(BuildContext context) {
        final iconNoResult = Visibility(
            visible: _noResult,
            child: Container(
                color: Color.fromRGBO(255, 255, 255, 0),
                child: Image(
                    image: AssetImage("assets/search_bg.png")
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
            HttpService http = HttpService();

            if (text.isNotEmpty) {
                hideNoResult();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new SearchImages(text)),
                );
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
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Rechercher une image...",
                    filled: true,
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0)
                    ),
                ),
            ),
        );
        return Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/search_bg.png"),
                        fit: BoxFit.cover
                    ),
                ),
                child: ListView(
                    children: <Widget>[searchBar],
                ),
            ),
        );
    }
}

class SearchImages extends StatefulWidget {

    var _text;

    SearchImages(var text)
    {
        _text = text;
    }

    @override
    _SearchImages createState() => new _SearchImages(_text);
}

class _SearchImages extends State<SearchImages>
{
    var _text;
    var _targetUrl;

    _SearchImages(var text)
    {
        _text = text;
        _targetUrl = "https://images-api.nasa.gov/search?q=" + text;
    }

    @override
    Widget build(BuildContext context) {
        HttpService http = HttpService();
        Future<Map> elems = http.getRequest(_targetUrl);

        var futureBuilder = new FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData) {
                    return (createListView(context, map.data));
                }
                return (Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 250),
                    child: CircularProgressIndicator()
                ));
            },
        );

        return new Scaffold(
            appBar: new AppBar(
                title: new Text(_text),
            ),
            body: futureBuilder,
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        );
    }

    String cutString(int cut, String str) {
        return (str.length <= cut) ? str : '${str.substring(0, cut)}...';
    }

    Widget createListView(BuildContext context, var data) {
        List values = data["collection"]["items"].toList();

        return new ListView.builder(
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index)
            {
                return new Column(
                    children: <Widget>[GestureDetector(
                        onTap: () {
                            HttpServiceList http = HttpServiceList();
                            http.getRequest(values[index]["href"]).then((result) {
                                for (var i = 0; i < result.length; i++) {
                                    if (result[i].toString().endsWith(".mp4")) {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MyWebView(
                                                    title: values[index]["data"][0]["title"],
                                                    selectedUrl: result[i],
                                                )
                                        ));
                                        return;
                                    }
                                }
                            });
                        },
                        child: Container(
                        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        decoration: new BoxDecoration(
                            color: Colors.white10,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(20.0),
                                topRight: const Radius.circular(20.0),
                                bottomRight: const Radius.circular(20.0),
                                bottomLeft: const Radius.circular(20.0)),
                            border: Border.all(
                                width: 1,
                                color: Colors.white30
                            )
                        ),
                        child: Column(
                            children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Text(
                                        values[index]["data"][0]["title"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                        ),
                                    ),),
                                Stack(
                                    children: <Widget>[Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.all(100),
                                        child: CircularProgressIndicator()
                                    ), Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: 20),
                                        child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            image: (values[index].containsKey(
                                                "links")
                                                ? values[index]["links"][0]["href"]
                                                : ""),
                                            width: 340,
                                            height: 200,
                                            fit: BoxFit.fill,
                                        ),
                                    ),
                                    ],
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10,
                                        left: 40,
                                        right: 40,
                                        bottom: 40),
                                    child: Text(
                                        cutString(400,
                                            values[index]["data"][0]["description"]),
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                    ),
                                ),
                            ]
                        ),
                    ),),
                    ]
                );
            });
    }
}
