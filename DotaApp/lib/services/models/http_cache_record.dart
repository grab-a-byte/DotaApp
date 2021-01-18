import 'package:equatable/equatable.dart';

class HttpCacheRecord extends Equatable {
  static String UniqueUrlColumnName = "uniqueUrl";
  static String CalledDateTimeColumnName = "calledDateTime";
  static String ResponseColumnName = "response";

  final String uniqueUrl;
  final DateTime dateTime;
  final String response;

  HttpCacheRecord(this.uniqueUrl, this.dateTime, this.response);

  factory HttpCacheRecord.fromMap(Map<String, dynamic> json) {
    return HttpCacheRecord(
        json[UniqueUrlColumnName] as String,
        DateTime.parse(json[CalledDateTimeColumnName]),
        json[ResponseColumnName]);
  }

  Map<String, dynamic> toMap() {
    return {
      UniqueUrlColumnName: uniqueUrl,
      CalledDateTimeColumnName: dateTime.toString(),
      ResponseColumnName: response
    };
  }

  @override
  List<Object> get props => [uniqueUrl, dateTime, response];
}
