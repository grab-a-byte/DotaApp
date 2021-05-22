import 'package:equatable/equatable.dart';

class HttpCacheRecord extends Equatable {
  static String uniqueUrlColumnName = "uniqueUrl";
  static String calledDateTimeColumnName = "calledDateTime";
  static String responseColumnName = "response";

  final String uniqueUrl;
  final DateTime dateTime;
  final String response;

  HttpCacheRecord(this.uniqueUrl, this.dateTime, this.response);

  factory HttpCacheRecord.fromMap(Map<String, dynamic> json) {
    return HttpCacheRecord(
        json[uniqueUrlColumnName],
        DateTime.parse(json[calledDateTimeColumnName]),
        json[responseColumnName]);
  }

  Map<String, dynamic> toMap() {
    return {
      uniqueUrlColumnName: uniqueUrl,
      calledDateTimeColumnName: dateTime.toString(),
      responseColumnName: response
    };
  }

  @override
  List<Object?> get props => [uniqueUrl, dateTime, response];
}
