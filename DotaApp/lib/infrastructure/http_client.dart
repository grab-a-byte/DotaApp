import 'dart:html';

import 'package:http/http.dart' as http;

import 'http_client_interface.dart';

class HttpClient implements IHttpClient {
  @override
  Future<String> get(Uri url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Http call failed for $url");
    }
  }
}
