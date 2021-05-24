class Result<T> {
  final bool success;
  final T? data;

  bool get unsuccessful => !success;

  Result.error()
      : success = false,
        data = null;

  Result.success(this.data) : success = true;
}
