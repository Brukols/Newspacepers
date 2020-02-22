import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:epi_space/ImageDayRoute/NasaApi.dart';
import 'package:epi_space/ImageDayRoute/HttpService.dart';
import 'package:http/http.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';

class ImageDayRoute extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        HttpService http = HttpService();
        Future<Map> elems = http.getNasaRequest();

        final NasaTitle = FutureBuilder(
            future: elems,
            builder: (context, map) {
                if (map.hasData) {
                    return (Container(
                        alignment: Alignment.topCenter,
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

        final NasaImage = FutureBuilder(
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
                                        image: map.data["url"],
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
                return (Text(""));
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
                            semanticLabel: 'Text to announce in accessibility modes',
                        ),
                    ));
                }
                return (Text(""));
            },
        );
        return Scaffold(
            appBar: AppBar(
                title: Text("Photo du jour"),
            ),
            body: ListView(
                children: <Widget>[NasaImage, NasaTitle, date, iconQuote, explanation],
            )
        );
    }
}