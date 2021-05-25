import 'package:dota_app/infrastructure/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Sets success flag to false when using error constructor", () {
    Result result = Result.error();
    expect(result.success, false);
  });

  test("Sets data to null when using error constructor", () {
    Result result = Result.error();
    expect(result.data, null);
  });

  test("Sets success flag to true when using success constructor", () {
    Result result = Result.success("");
    expect(result.success, true);
  });

  test("Sets data to provided data when using success constructor", () {
    Result result = Result.success("result");
    expect(result.data, "result");
  });
}
