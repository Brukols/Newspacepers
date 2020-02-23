import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpService
{
    Future<Map> getRequest(var url) async {
        http.Response response = await http.get(url);

        // Creation of the map
        Map body = convert.jsonDecode(response.body);

        return (body);
    }
}

class HttpServiceList
{
    Future<List> getRequest(var url) async {
        http.Response response = await http.get(url);

        List body = convert.jsonDecode(response.body);

        return (body);
    }
}