import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_rick_and_morty/data/models/character.dart';

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter({
    required int page,
    String name = '',
    String status = '',
    String species = '',
    String gender = '',
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://rickandmortyapi.com/api/character/?page=$page&name=$name&status=$status&species=$species&gender=$gender',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Add this check to handle null response
        if (data['results'] != null && data['info'] != null) {
          final character = Character.fromJson(data);
          return character;
        } else {
          throw Exception('Failed to load data');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}
