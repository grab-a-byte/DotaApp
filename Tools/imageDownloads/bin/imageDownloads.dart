import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'api_response.dart';

String getHomePath() {
  var envVars = Platform.environment;
  if (Platform.isMacOS) {
    return envVars['HOME'];
  } else if (Platform.isLinux) {
    return envVars['HOME'];
  } else if (Platform.isWindows) {
    return envVars['UserProfile'];
  } else {
    return 'KABOOM';
  }
}

String getDownloadsPath() {
  var home = getHomePath();
  return path.join(home, 'Downloads');
}

Future<List<ApiResponse>> getApiResponse(String apiType) async {
  var response =
      await http.get(Uri.parse('https://api.stratz.com/api/v1/${apiType}'));
  LinkedHashMap json = jsonDecode(response.body);
  return json.values.map((e) => ApiResponse.fromJson(e)).toList();
}

void main(List<String> arguments) async {
  downloadHeroImages();
  downloadItemImages();
  downloadAbilityImages();
}

void downloadHeroImages() =>
    downloadImages('hero', 'heroes', imageAppend: '_vert');

void downloadItemImages() => downloadImages('item', 'items');

void downloadAbilityImages() => downloadImages('ability', 'abilities');

void downloadImages(String apiType, String cdnType,
    {String imageAppend = ''}) async {
  var responses = await getApiResponse(apiType);

  var downloadsPath = path.join(getDownloadsPath(), 'doataAppImages', apiType);

  await Directory(downloadsPath).create(recursive: true);

  for (var apiResponse in responses) {
    try {
      var imageName = apiResponse.shortName ?? apiResponse.name;

      var image_url =
          'https://cdn.stratz.com/images/dota2/${cdnType}/${imageName}${imageAppend}.png';

      print(image_url);

      var response = await http.get(image_url);

      var filePath = path.join(downloadsPath, '${imageName}_vert.png');

      var file2 = File(filePath);
      await file2.writeAsBytes(response.bodyBytes,
          flush: true, mode: FileMode.write);
    } on Object {
      return;
    }
  }
  ;
}
