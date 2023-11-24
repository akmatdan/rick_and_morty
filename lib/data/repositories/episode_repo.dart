import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_rick_and_morty/data/models/episode.dart';

class EpisodeRepo {
  final url = 'https://rickandmortyapi.com/api/episode';

  Future<Episode> getEpisode(int page, String name) async {
    try {
      var response = await http.get(Uri.parse('$url?page=$page&name=$name'));

      var jsonResult = json.decode(response.body);
      return Episode.fromJson(jsonResult);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
