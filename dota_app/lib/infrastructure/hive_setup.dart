import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../services/models/http_cache_record_hive_adaptor.dart';

Future initializeHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(HttpCacheRecordHiveAdapter());
}
