import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:epi_space/ImageDayRoute/NasaApi.dart';
import 'package:epi_space/ImageDayRoute/HttpService.dart';
import 'package:http/http.dart';

class ImageDayRoute extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        HttpService http = HttpService();
        Future<Map> elems = http.getNasaRequest();

        return Scaffold(
            appBar: AppBar(
                title: Text("Second Route"),
            ),
            body: FutureBuilder(
                    future: elems,
                    builder: (context, map) {
                        if (map.hasData)
                            return Image.network(map.data['url']);
                        return (Text("Loading..."));
                    },
            ),
        );
    }
}