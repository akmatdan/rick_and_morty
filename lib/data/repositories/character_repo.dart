import 'dart:convert';

import 'package:the_rick_and_morty/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name, String status) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri.replace(
        queryParameters: {'page': '$page', 'name': name, 'status': status},
      ));
      var jsonResult = json.decode(response.body);
      return Character.fromJson(jsonResult);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
