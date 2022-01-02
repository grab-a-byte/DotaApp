import 'package:hive/hive.dart';

import 'http_cache_record.dart';

class HttpCacheRecordHiveAdapter extends TypeAdapter<HttpCacheRecord> {
  @override
  int get typeId => 0;

  @override
  HttpCacheRecord read(BinaryReader reader) {
    return HttpCacheRecord(reader.read(), reader.read(), reader.read());
  }

  @override
  void write(BinaryWriter writer, HttpCacheRecord obj) {
    writer.write(obj.uniqueUrl);
    writer.write(obj.dateTime);
    writer.write(obj.response);
  }
}
