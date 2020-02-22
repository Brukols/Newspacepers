import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:epi_space/ImageDayRoute/NasaApi.dart';
import 'package:http/http.dart' as http;

class HttpService
{
    final String url = "https://api.nasa.gov/planetary/apod?api_key=msALziHDtczCBMjvfrvOVW7qR7dYSIsja3pTwdso";

    Future<Map> getNasaRequest() async {
        http.Response response = await http.get(url);

        // Creation of the map
        Map body = convert.jsonDecode(response.body);

        return (body);
    }
}