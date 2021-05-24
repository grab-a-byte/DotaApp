typedef GetFunction = Future<String> Function(String url);

mixin IHttpCache {
  Future<String> get(String url, GetFunction func);
}
