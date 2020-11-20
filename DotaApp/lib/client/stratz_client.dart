import 'dart:collection';
import 'dart:convert';

import 'package:DotaApp/client/models/hero.dart';
import 'package:DotaApp/client/stratz_client_interface.dart';
import 'package:DotaApp/infrastructure/http_client_interface.dart';

class StratzClient implements IStratzClient {
  final String heroesEndpoint = "https://api.stratz.com/api/v1/hero";

  final IHttpClient _client;

  StratzClient(this._client);

  @override
  Future<List<Hero>> getHeroes() async {
    String response = await _client.get(Uri.parse(heroesEndpoint));
    LinkedHashMap json = jsonDecode(response);
    return json.values.map((e) => Hero.fromJson(e)).toList();
  }
}
