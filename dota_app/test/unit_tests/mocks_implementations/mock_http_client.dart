import 'package:DotaApp/infrastructure/http_client_interface.dart';

class MockHttpClient implements IHttpClient {
  String? getValue;

  MockHttpClient({this.getValue});

  @override
  Future<String> get(Uri url) => Future.value(getValue);
}
