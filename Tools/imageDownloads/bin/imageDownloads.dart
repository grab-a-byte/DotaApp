import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'hero.dart';

String getHomePath() {
  var envVars = Platform.environment;
  if (Platform.isMacOS) {
    return envVars['HOME'];
  } else if (Platform.isLinux) {
    return envVars['HOME'];
  } else if (Platform.isWindows) {
    return envVars['UserProfile'];
  }
}

String getDownloadsPath() {
  var home = getHomePath();
  return path.join(home, 'Downloads');
}

Future<List<Hero>> getHeroes() async {
  var response =
      await http.get(Uri.parse('https://api.stratz.com/api/v1/hero'));
  LinkedHashMap json = jsonDecode(response.body);
  return json.values.map((e) => Hero.fromJson(e)).toList();
}

void main(List<String> arguments) async {
  List<Hero> heroes = await getHeroes();

  var downloadsPath = path.join(getDownloadsPath(), 'images');

  await Directory(downloadsPath).create(recursive: true);

  heroes.forEach((hero) async {
    var hero_url =
        'https://cdn.stratz.com/images/dota2/heroes/${hero.shortName}_vert.png';

    var response = await http.get(hero_url);

    var filePath = path.join(downloadsPath, '${hero.shortName}_vert.png');

    var file2 = File(filePath);
    await file2.writeAsBytes(response.bodyBytes,
        flush: true, mode: FileMode.write);
  });
}
