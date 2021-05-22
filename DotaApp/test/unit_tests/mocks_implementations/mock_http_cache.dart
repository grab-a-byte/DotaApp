import 'package:DotaApp/infrastructure/http_cache_interface.dart';

class MockHttpCache implements IHttpCache {
  String? getValue;

  MockHttpCache({this.getValue});

  @override
  Future<String> get(String url, GetFunction func) => Future.value(getValue);
}
