import 'dart:html';

import 'http_cache_interface.dart';

class WebHttpCache implements IHttpCache {
  final Storage _localStorage = window.localStorage;

  @override
  Future<String> get(String url, GetFunction func) async {
    if (_localStorage[url] == null) {
      _localStorage[url] = await func(url);
    }
    return _localStorage[url]!;
  }
}
